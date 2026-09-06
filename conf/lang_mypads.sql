-- Set MyPads' default UI language to the one picked at install time.
-- INSERT ... ON DUPLICATE KEY UPDATE rather than a plain UPDATE: on a fresh
-- install MyPads has not necessarily written its config keys yet, and a bare
-- UPDATE would silently match no row.
INSERT INTO `store` (`key`, `value`)
VALUES ('mypads:conf:defaultLanguage', '"__LANGUAGE__"')
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
