-- Case with Organisation (LEFT JOIN keeps missing orgs)
CREATE OR REPLACE VIEW case_with_org AS
SELECT
  fc.*,
  o.org_id,
  o.title AS org_title,
  o.country AS org_country,
  o.city AS org_city
FROM fact_cases fc
LEFT JOIN dim_organisations o
  ON fc.primary_org_id = o.org_id;


-- Case ↔ Method detail (assumes bridge_case_method exists)
CREATE OR REPLACE VIEW case_method_detail AS
SELECT
  b.case_id,
  m.method_id,
  m.method_types,
  m.purpose_method,
  m.country AS method_country
FROM bridge_case_method b
JOIN dim_methods m
  ON b.method_id = m.method_id;


-- Example ONLY: Not implemented in the current Power BI model
-- Demonstrates how many-to-many case-method relationships
-- could be normalized in a production system.

CREATE VIEW bridge_case_method AS
SELECT
  case_id,
  method_id
FROM 