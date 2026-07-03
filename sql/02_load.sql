-- =====================================================================
-- 02_load.sql  ·  DML — load the cleaned/segmented data into `customers`
-- =====================================================================
-- Run AFTER 01_schema.sql has created the customers table.
--
-- `\copy` is a psql client-side command, so run this from the PROJECT ROOT
-- (the folder that contains data/) for the relative path to resolve:
--
--     psql -d marketing -f sql/02_load.sql
--
-- The CSV column order matches the table's column order, so COPY loads the
-- rows by position; the mixed-case CSV header row is skipped via HEADER true.
-- (In the notebook 04_sql.ipynb the same load is done with pandas' to_sql();
--  this script is the equivalent pure-SQL DML.)
-- =====================================================================

-- Start from an empty table so the load is repeatable.
TRUNCATE TABLE customers;

-- Bulk-load the 56,000 rows from the final segmented dataset.
\copy customers FROM 'data/marketing_segmented.csv' WITH (FORMAT csv, HEADER true, NULL '');

-- Sanity check: confirm the row count and that IDs are unique.
SELECT count(*) AS rows_loaded, count(DISTINCT id) AS distinct_ids
FROM customers;
