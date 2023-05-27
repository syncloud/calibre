PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE settings (
	id INTEGER NOT NULL, 
	mail_server VARCHAR, 
	mail_port INTEGER, 
	mail_use_ssl SMALLINT, 
	mail_login VARCHAR, 
	mail_password VARCHAR, 
	mail_from VARCHAR, 
	config_calibre_dir VARCHAR, 
	config_port INTEGER, 
	config_certfile VARCHAR, 
	config_keyfile VARCHAR, 
	config_calibre_web_title VARCHAR, 
	config_books_per_page INTEGER, 
	config_random_books INTEGER, 
	config_read_column INTEGER, 
	config_title_regex VARCHAR, 
	config_log_level SMALLINT, 
	config_uploading SMALLINT, 
	config_anonbrowse SMALLINT, 
	config_public_reg SMALLINT, 
	config_default_role SMALLINT, 
	config_default_show SMALLINT, 
	config_columns_to_ignore VARCHAR, 
	config_use_google_drive BOOLEAN, 
	config_google_drive_folder VARCHAR, 
	config_google_drive_watch_changes_response VARCHAR, 
	config_remote_login BOOLEAN, 
	config_use_goodreads BOOLEAN, 
	config_goodreads_api_key VARCHAR, 
	config_goodreads_api_secret VARCHAR, 
	config_mature_content_tags VARCHAR, 
	config_logfile VARCHAR, 
	config_ebookconverter INTEGER, 
	config_converterpath VARCHAR, 
	config_calibre VARCHAR, 
	config_rarfile_location VARCHAR,
	`config_authors_max` INTEGER DEFAULT 0,
	`config_theme` INTEGER DEFAULT 0,
	`config_access_log` SMALLINT DEFAULT 0,
	`config_access_logfile` VARCHAR,
	`config_kobo_sync` BOOLEAN DEFAULT 0,
	`config_denied_tags` VARCHAR DEFAULT '',
	`config_allowed_tags` VARCHAR DEFAULT '',
	`config_restricted_column` SMALLINT DEFAULT 0,
	`config_denied_column_value` VARCHAR DEFAULT '',
	`config_allowed_column_value` VARCHAR DEFAULT '',
	`config_login_type` INTEGER DEFAULT 0,
	`config_kobo_proxy` BOOLEAN DEFAULT 0,
	`config_ldap_provider_url` VARCHAR DEFAULT 'localhost',
	`config_ldap_port` SMALLINT DEFAULT 389,
	`config_ldap_schema` VARCHAR DEFAULT 'ldap',
	`config_ldap_serv_username` VARCHAR,
    `config_ldap_serv_password` VARCHAR,
    `config_ldap_use_ssl` BOOLEAN DEFAULT 0,
    `config_ldap_use_tls` BOOLEAN DEFAULT 0,
    `config_ldap_require_cert` BOOLEAN DEFAULT 0,
    `config_ldap_cert_path` VARCHAR,
    `config_ldap_dn` VARCHAR,
    `config_ldap_user_object` VARCHAR,
    `config_ldap_openldap` BOOLEAN DEFAULT 0,
    `config_updatechannel` INTEGER DEFAULT 0,
    `config_reverse_proxy_login_header_name` VARCHAR,
    `config_allow_reverse_proxy_header_login` BOOLEAN DEFAULT 0,
    'mail_password_e' String,
    'config_goodreads_api_secret_e' String,
    'config_ldap_serv_password_e' String,
    `mail_size` INTEGER DEFAULT `26214400`,
    `mail_server_type` SMALLINT DEFAULT `0`,
    `mail_gmail_token` JSON DEFAULT `{}`,
    `config_calibre_uuid` VARCHAR,
    `config_external_port` INTEGER DEFAULT `8083`,
    `config_trustedhosts` VARCHAR DEFAULT ``,
    `config_default_language` VARCHAR(3) DEFAULT `all`,
    `config_default_locale` VARCHAR(2) DEFAULT `en`,
    `config_register_email` BOOLEAN DEFAULT 0,
    `config_ldap_authentication` SMALLINT DEFAULT `0`,
    `config_ldap_encryption` SMALLINT DEFAULT `0`,
    `config_ldap_cacert_path` VARCHAR DEFAULT ``,
    `config_ldap_key_path` VARCHAR DEFAULT ``,
    `config_ldap_member_user_object` VARCHAR DEFAULT ``,
    `config_ldap_group_object_filter` VARCHAR DEFAULT `(&(objectclass=posixGroup)(cn=%s))`,
    `config_ldap_group_members_field` VARCHAR DEFAULT `memberUid`,
    `config_ldap_group_name` VARCHAR DEFAULT `calibreweb`,
    `config_kepubifypath` VARCHAR,
    `config_upload_formats` VARCHAR DEFAULT `cbz,pdf,m4b,epub,opus,kepub,azw,ogg,flac,cbt,txt,mp3,djvu,azw3,html,rtf,docx,mp4,m4a,mobi,wav,lit,doc,odt,cbr,prc,fb2`,
    `config_unicode_filename` BOOLEAN DEFAULT 0,
    `schedule_start_time` INTEGER DEFAULT `4`,
    `schedule_duration` INTEGER DEFAULT `10`,
    `schedule_generate_book_covers` BOOLEAN DEFAULT 0,
    `schedule_generate_series_covers` BOOLEAN DEFAULT 0,
    `schedule_reconnect` BOOLEAN DEFAULT 0,
    `schedule_metadata_backup` BOOLEAN DEFAULT 0,
    `config_password_policy` BOOLEAN DEFAULT 1,
    `config_password_min_length` INTEGER DEFAULT `8`,
    `config_password_number` BOOLEAN DEFAULT 1,
    `config_password_lower` BOOLEAN DEFAULT 1,
    `config_password_upper` BOOLEAN DEFAULT 1,
    `config_password_special` BOOLEAN DEFAULT 1,
    `config_session` INTEGER DEFAULT `1`,
    `config_ratelimiter` BOOLEAN DEFAULT 1,
	PRIMARY KEY (id), 
	CHECK (config_use_google_drive IN (0, 1)), 
	CHECK (config_remote_login IN (0, 1)), 
	CHECK (config_use_goodreads IN (0, 1))
);
INSERT INTO settings (id) VALUES(1)
update settings set mail_server='localhost' where id = 1;
update settings set mail_server='localhost' where id = 1;
update settings set mail_port = 25 where id = 1;
update settings set mail_use_ssl = 0 where id = 1;
update settings set mail_login = 'mail@example.com' where id = 1;
update settings set mail_password = NULL where id = 1;
update settings set mail_from = 'calibre <mail@example.com>' where id = 1;
update settings set config_calibre_dir = NULL where id = 1;
update settings set config_port = 8083 where id = 1;
update settings set config_certfile = NULL where id = 1;
update settings set config_keyfile = NULL where id = 1;
update settings set config_calibre_web_title = 'Calibre-Web' where id = 1;
update settings set config_books_per_page = 60 where id = 1;
update settings set config_random_books = 4 where id = 1;
update settings set config_read_column = 0 where id = 1;
update settings set config_title_regex = '^(A|The|An|Der|Die|Das|Den|Ein|Eine|Einen|Dem|Des|Einem|Eines)\s+' where id = 1;
update settings set config_log_level = 20 where id = 1;
update settings set config_uploading = 0 where id = 1;
update settings set config_anonbrowse = 0 where id = 1;
update settings set config_public_reg = 0 where id = 1;
update settings set config_default_role = 0 where id = 1;
update settings set config_default_show = 6143 where id = 1;
update settings set config_columns_to_ignore = NULL where id = 1;
update settings set config_use_google_drive = 0 where id = 1;
update settings set config_google_drive_folder = NULL where id = 1;
update settings set config_google_drive_watch_changes_response = NULL where id = 1;
update settings set config_remote_login = 0 where id = 1;
update settings set config_use_goodreads = 0 where id = 1;
update settings set config_goodreads_api_key = NULL where id = 1;
update settings set config_goodreads_api_secret = NULL where id = 1;
update settings set config_mature_content_tags = '' where id = 1;
update settings set config_logfile = NULL where id = 1;
update settings set config_ebookconverter = 0 where id = 1;
update settings set config_converterpath = '' where id = 1;
update settings set config_calibre = NULL where id = 1;
update settings set config_rarfile_location = '' where id = 1;
update settings set config_authors_max = 0 where id = 1;
update settings set config_theme = 0 where id = 1;
update settings set config_access_log = 0 where id = 1;
update settings set config_access_logfile = NULL where id = 1;
update settings set config_kobo_sync = 0 where id = 1;
update settings set config_denied_tags = '' where id = 1;
update settings set config_allowed_tags = '' where id = 1;
update settings set config_restricted_column = 0 where id = 1;
update settings set config_denied_column_value = '' where id = 1;
update settings set config_allowed_column_value = '' where id = 1;
update settings set config_login_type = 1 where id = 1;
update settings set config_kobo_proxy = 0 where id = 1;
update settings set config_ldap_provider_url = 'localhost' where id = 1;
update settings set config_ldap_port = 389 where id = 1;
update settings set config_ldap_schema = 'ldap' where id = 1;
update settings set config_ldap_serv_username = 'cn=admin,dc=syncloud,dc=org' where id = 1;
update settings set config_ldap_serv_password = 'syncloud' where id = 1;
update settings set config_ldap_use_ssl = 0 where id = 1;
update settings set config_ldap_use_tls = 0 where id = 1;
update settings set config_ldap_require_cert = 0 where id = 1;
update settings set config_ldap_cert_path = NULL where id = 1;
update settings set config_ldap_dn = 'ou=users,dc=syncloud,dc=org' where id = 1;
update settings set config_ldap_user_object = '(&(objectclass=posixGroup)(cn=%s))' where id = 1;
update settings set config_ldap_openldap = 1 where id = 1;
update settings set config_updatechannel = 0 where id = 1;
update settings set config_reverse_proxy_login_header_name = NULL where id = 1;
update settings set config_allow_reverse_proxy_header_login = 0 where id = 1;
update settings set mail_password_e = X'674141414141426b62356a6471567a7167414d6a6146426d597674554331547a78586b706d554d42616c3276336b635156627252415278656e487569674d5572394474647259466c3847434d78337359425f637132556a75357549715030437543413d3d' where id = 1;
update settings set config_goodreads_api_secret_e = NULL where id = 1;
update settings set config_ldap_serv_password_e = NULL where id = 1;
update settings set mail_size = 26214400 where id = 1;
update settings set mail_server_type = 0 where id = 1;
update settings set mail_gmail_token = '{}' where id = 1;
update settings set config_calibre_uuid = NULL where id = 1;
update settings set config_external_port = 8083 where id = 1;
update settings set config_trustedhosts = '' where id = 1;
update settings set config_default_language = 'all' where id = 1;
update settings set config_default_locale = 'en' where id = 1;
update settings set config_register_email = 0 where id = 1;
update settings set config_ldap_authentication = 0 where id = 1;
update settings set config_ldap_encryption = 0 where id = 1;
update settings set config_ldap_cacert_path = '' where id = 1;
update settings set config_ldap_key_path = '' where id = 1;
update settings set config_ldap_member_user_object = '' where id = 1;
update settings set config_ldap_group_object_filter = '(&(objectclass=posixGroup)(cn=%s))' where id = 1;
update settings set config_ldap_group_members_field = 'memberUid' where id = 1;
update settings set config_ldap_group_name = 'calibreweb' where id = 1;
update settings set config_kepubifypath = '' where id = 1;
update settings set config_upload_formats = 'cbz,pdf,m4b,epub,opus,kepub,azw,ogg,flac,cbt,txt,mp3,djvu,azw3,html,rtf,docx,mp4,m4a,mobi,wav,lit,doc,odt,cbr,prc,fb2' where id = 1;
update settings set config_unicode_filename = 0 where id = 1;
update settings set schedule_start_time = 4 where id = 1;
update settings set schedule_duration = 10 where id = 1;
update settings set schedule_generate_book_covers = 0 where id = 1;
update settings set schedule_generate_series_covers = 0 where id = 1;
update settings set schedule_reconnect = 0 where id = 1;
update settings set schedule_metadata_backup = 0 where id = 1;
update settings set config_password_policy = 1 where id = 1;
update settings set config_password_min_length = 8 where id = 1;
update settings set config_password_number = 1 where id = 1;
update settings set config_password_lower = 1 where id = 1;
update settings set config_password_upper = 1 where id = 1;
update settings set config_password_special = 1 where id = 1;
update settings set config_session = 1 where id = 1;
update settings set config_ratelimiter = 1 where id = 1;

CREATE TABLE registration (
	id INTEGER NOT NULL,
	domain VARCHAR, 'allow' INTEGER,
	PRIMARY KEY (id)
);
INSERT INTO registration VALUES(1,'%.%',1);
CREATE TABLE bookmark (
	id INTEGER NOT NULL,
	user_id INTEGER,
	book_id INTEGER,
	format VARCHAR COLLATE "NOCASE",
	bookmark_key VARCHAR,
	PRIMARY KEY (id),
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE shelf (
	id INTEGER NOT NULL, 
	name VARCHAR, 
	is_public INTEGER, 
	user_id INTEGER, 'uuid' STRING, 'created' DATETIME, 'last_modified' DATETIME, 'kobo_sync' BOOLEAN DEFAULT false, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE downloads (
	id INTEGER NOT NULL, 
	book_id INTEGER, 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE remote_auth_token (
	id INTEGER NOT NULL, 
	auth_token VARCHAR(8), 
	user_id INTEGER, 
	verified BOOLEAN, 
	expiration DATETIME, 'token_type' INTEGER DEFAULT 0, 
	PRIMARY KEY (id), 
	UNIQUE (auth_token), 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	CHECK (verified IN (0, 1))
);
CREATE TABLE book_read_link (
	id INTEGER NOT NULL, 
	book_id INTEGER, 
	user_id INTEGER, 
	is_read BOOLEAN, 'read_status' INTEGER DEFAULT 0, 'last_modified' DATETIME, 'last_time_started_reading' DATETIME, 'times_started_reading' INTEGER DEFAULT 0, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	CHECK (is_read IN (0, 1))
);
CREATE TABLE book_shelf_link (
	id INTEGER NOT NULL, 
	book_id INTEGER, 
	"order" INTEGER, 
	shelf INTEGER, 'date_added' DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(shelf) REFERENCES shelf (id)
);
CREATE TABLE IF NOT EXISTS "oauthProvider" (
	id INTEGER NOT NULL, 
	provider_name VARCHAR, 
	oauth_client_id VARCHAR, 
	oauth_client_secret VARCHAR, 
	active BOOLEAN, 
	PRIMARY KEY (id), 
	CHECK (active IN (0, 1))
);
INSERT INTO oauthProvider VALUES(1,'github',NULL,NULL,0);
INSERT INTO oauthProvider VALUES(2,'google',NULL,NULL,0);
CREATE TABLE flask_dance_oauth (
	id INTEGER NOT NULL, 
	provider VARCHAR(50) NOT NULL, 
	created_at DATETIME NOT NULL, 
	token JSON NOT NULL, 
	provider_user_id VARCHAR(256), 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE user_session (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	session_key VARCHAR, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE shelf_archive (
	id INTEGER NOT NULL, 
	uuid VARCHAR, 
	user_id INTEGER, 
	last_modified DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE archived_book (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	book_id INTEGER, 
	is_archived BOOLEAN, 
	last_modified DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE kobo_synced_books (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	book_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE kobo_reading_state (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	book_id INTEGER, 
	last_modified DATETIME, 
	priority_timestamp DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE thumbnail (
	id INTEGER NOT NULL, 
	entity_id INTEGER, 
	uuid VARCHAR, 
	format VARCHAR, 
	type SMALLINT, 
	resolution SMALLINT, 
	filename VARCHAR, 
	generated_at DATETIME, 
	expiration DATETIME, 
	PRIMARY KEY (id), 
	UNIQUE (uuid)
);
CREATE TABLE kobo_bookmark (
	id INTEGER NOT NULL, 
	kobo_reading_state_id INTEGER, 
	last_modified DATETIME, 
	location_source VARCHAR, 
	location_type VARCHAR, 
	location_value VARCHAR, 
	progress_percent FLOAT, 
	content_source_progress_percent FLOAT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(kobo_reading_state_id) REFERENCES kobo_reading_state (id)
);
CREATE TABLE kobo_statistics (
	id INTEGER NOT NULL, 
	kobo_reading_state_id INTEGER, 
	last_modified DATETIME, 
	remaining_time_minutes INTEGER, 
	spent_reading_minutes INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(kobo_reading_state_id) REFERENCES kobo_reading_state (id)
);
CREATE TABLE IF NOT EXISTS "user" (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,name VARCHAR(64),email VARCHAR(120),role SMALLINT,password VARCHAR,kindle_mail VARCHAR(120),locale VARCHAR(2),sidebar_view INTEGER,default_language VARCHAR(3),denied_tags VARCHAR,allowed_tags VARCHAR,denied_column_value VARCHAR,allowed_column_value VARCHAR,view_settings JSON,kobo_only_shelves_sync SMALLINT,UNIQUE (name),UNIQUE (email));
INSERT INTO user VALUES(1,'admin','',159,'pbkdf2:sha256:50000$Nyc0MwDU$cee9472a0f20e259efaa37f8ff60ab2dbd426871803226234c95f6c0b58547d1','','en',8191,'all','','','','','{}',0);
INSERT INTO user VALUES(2,'Guest','no@email',32,'','','en',1,'all','','','','','{}',0);
CREATE TABLE flask_settings (
	id INTEGER NOT NULL, 
	flask_session_key BLOB, 
	PRIMARY KEY (id)
);
INSERT INTO flask_settings VALUES(1,X'fec279dca101b3294908bbf0e458aaf8037b73d82d09c112545c17a511906d59');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('user',2);
COMMIT;
