use pubs;
SELECT table_name, table_type, ENGINE
FROM information_schema.tables
WHERE table_schema = 'pubs'
	AND table_type = 'BASE TABLE'
ORDER BY table_name DESC;


SELECT *
FROM information_schema.columns
WHERE table_schema = 'pubs'
	AND table_name = 'titles';

