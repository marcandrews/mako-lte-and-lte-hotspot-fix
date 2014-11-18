#!/sbin/sh
(
HOME=/tmp /tmp/sqlite3 /data/data/com.android.providers.settings/databases/settings.db << EOF

BEGIN EXCLUSIVE TRANSACTION;

DELETE FROM global WHERE name = 'preferred_network_mode';

INSERT INTO global (name, value) VALUES ('preferred_network_mode', 0);

END TRANSACTION;

VACUUM;

EOF
) || exit 1
