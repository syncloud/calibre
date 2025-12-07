package installer

import (
	"fmt"
	"strings"

	"github.com/google/uuid"
	cp "github.com/otiai10/copy"
	"github.com/syncloud/golib/config"
	"github.com/syncloud/golib/linux"
	"github.com/syncloud/golib/platform"
	"go.uber.org/zap"

	"os"
	"path"
)

const App = "calibre"

type Variables struct {
	App        string
	AppDir     string
	DataDir    string
	CommonDir  string
	AppKey     string
	AppUrl     string
	AppDomain  string
	Domain     string
	StorageDir string
}

type Installer struct {
	newVersionFile     string
	currentVersionFile string
	configDir          string
	platformClient     *platform.Client
	installFile        string
	appDir             string
	dataDir            string
	commonDir          string
	logger             *zap.Logger
}

func New(logger *zap.Logger) *Installer {
	appDir := fmt.Sprintf("/snap/%s/current", App)
	dataDir := fmt.Sprintf("/var/snap/%s/current", App)
	commonDir := fmt.Sprintf("/var/snap/%s/common", App)
	configDir := path.Join(dataDir, "config")
	return &Installer{
		newVersionFile:     path.Join(appDir, "version"),
		currentVersionFile: path.Join(dataDir, "version"),
		configDir:          configDir,
		platformClient:     platform.New(),
		installFile:        path.Join(dataDir, "installed"),
		appDir:             appDir,
		dataDir:            dataDir,
		commonDir:          commonDir,
		logger:             logger,
	}
}

func (i *Installer) Install() error {
	err := linux.CreateUser(App)
	if err != nil {
		return err
	}

	err = i.UpdateConfigs()
	if err != nil {
		return err
	}

	err = cp.Copy(path.Join(i.appDir, "calibre/web/app.db"), path.Join(i.dataDir, "app.db"))
	if err != nil {
		return err
	}

	err = cp.Copy(path.Join(i.appDir, "calibre/web/metadata.db"), path.Join(i.dataDir, "metadata.db"))
	if err != nil {
		return err
	}

	secretKey := uuid.New().String()
	err = os.WriteFile(path.Join(i.dataDir, "secret.key"), []byte(secretKey), 0644)
	if err != nil {
		return err
	}

	err = os.Mkdir(path.Join(i.commonDir, "nginx"), 0755)
	if err != nil {
		return err
	}

	err = os.Mkdir(path.Join(i.commonDir, "log"), 0755)
	if err != nil {
		return err
	}

	err = i.FixPermissions()
	if err != nil {
		return err
	}
	return nil
}

func (i *Installer) Configure() error {
	return i.UpdateVersion()
}

func (i *Installer) PreRefresh() error {
	return nil
}

func (i *Installer) PostRefresh() error {
	err := i.UpdateConfigs()
	if err != nil {
		return err
	}

	err = i.ClearVersion()
	if err != nil {
		return err
	}

	err = i.FixPermissions()
	if err != nil {
		return err
	}
	return nil

}

func (i *Installer) ClearVersion() error {
	return os.RemoveAll(i.currentVersionFile)
}

func (i *Installer) UpdateVersion() error {
	return cp.Copy(i.newVersionFile, i.currentVersionFile)
}

func (i *Installer) UpdateConfigs() error {

	storageDir, err := i.platformClient.InitStorage(App, App)
	if err != nil {
		return err
	}

	err = linux.CreateMissingDirs(
		path.Join(i.dataDir, "nginx"),
	)
	if err != nil {
		return err
	}

	err = linux.Chown(i.dataDir, App)
	if err != nil {
		return err
	}

	appUrl, err := i.platformClient.GetAppUrl(App)
	if err != nil {
		return err
	}

	appDomain, err := i.platformClient.GetAppDomainName(App)
	if err != nil {
		return err
	}

	domain, found := strings.CutPrefix(appDomain, App)
	if !found {
		return fmt.Errorf("%s is not in %s", App, appDomain)
	}

	variables := Variables{
		App:        App,
		AppDir:     i.appDir,
		DataDir:    i.dataDir,
		CommonDir:  i.commonDir,
		AppUrl:     appUrl,
		AppDomain:  appDomain,
		Domain:     domain,
		StorageDir: storageDir,
	}

	err = config.Generate(
		path.Join(i.appDir, "config"),
		path.Join(i.dataDir, "config"),
		variables,
	)
	if err != nil {
		return err
	}
	return nil
}
func (i *Installer) StorageChange() error {
	storageDir, err := i.platformClient.InitStorage(App, App)
	if err != nil {
		return err
	}

	err = linux.Chown(storageDir, App)
	if err != nil {
		return err
	}
	return nil
}

func (i *Installer) BackupPreStop() error {
	return i.PreRefresh()
}

func (i *Installer) RestorePreStart() error {
	return i.PostRefresh()
}

func (i *Installer) RestorePostStart() error {
	return i.Configure()
}

func (i *Installer) AccessChange() error {
	return i.UpdateConfigs()
}

func (i *Installer) FixPermissions() error {
	err := linux.Chown(i.dataDir, App)
	if err != nil {
		return err
	}
	err = linux.Chown(i.commonDir, App)
	if err != nil {
		return err
	}
	return nil
}
