import pytest
from os.path import dirname, join
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from subprocess import check_output
from syncloudlib.integration.hosts import add_host_alias

DIR = dirname(__file__)
TMP_DIR = '/tmp/syncloud/ui'


@pytest.fixture(scope="session")
def module_setup(request, device, artifact_dir, ui_mode):
    def module_teardown():
        device.activated()
        device.run_ssh('mkdir -p {0}'.format(TMP_DIR), throw=False)
        device.run_ssh('journalctl > {0}/journalctl.ui.{1}.log'.format(TMP_DIR, ui_mode), throw=False)
        device.run_ssh('snap run calibre.sqlite /var/snap/calibre/current/app.db .dump > {0}/app.ui.db.dump.log'.format(TMP_DIR),
                       throw=False)
        device.scp_from_device('{0}/*'.format(TMP_DIR), join(artifact_dir, 'log'))
        check_output('cp /videos/* {0}'.format(artifact_dir), shell=True)
        check_output('chmod -R a+r {0}'.format(artifact_dir), shell=True)

    request.addfinalizer(module_teardown)


def test_start(module_setup, app, domain, device_host):
    add_host_alias(app, device_host, domain)


def test_login(selenium, device_user, device_password):
    selenium.open_app()
    selenium.find_by_xpath("//input[@name='username']").send_keys(device_user)
    password = selenium.find_by_xpath("//input[@name='password']")
    password.send_keys(device_password)
    selenium.screenshot('login')
    password.send_keys(Keys.RETURN)
    selenium.find_by_xpath("//h2[contains(.,'Discover')]")
    selenium.screenshot('main')


def test_upload(selenium):
    check_output(['wget', 'https://github.com/IDPF/epub3-samples/releases/download/20170606/vertically-scrollable-manga.epub'])
    selenium.find_by_xpath("//input[@name='btn-upload']").send_keys('vertically-scrollable-manga.epub')
    selenium.screenshot('upload')


def test_teardown(driver):
    driver.quit()
