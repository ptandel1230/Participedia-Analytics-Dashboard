-- Participedia-style model (Fact + Dimensions + Bridges)
-- Works best in a BI-friendly star schema.
-- If you're using MySQL/Snowflake/Postgres, create tables then load the *_clean.csv exports.

-- FACT
CREATE TABLE fact_cases (
  case_id BIGINT PRIMARY KEY,
  type VARCHAR(50),
  post_date VARCHAR(50),
  updated_date VARCHAR(50),
  published VARCHAR(20),
  country VARCHAR(200),
  province VARCHAR(200),
  city VARCHAR(200),
  location_name VARCHAR(500),
  country_best VARCHAR(200),
  city_best VARCHAR(500),
  approaches TEXT,
  method_types TEXT,
  tools_techniques_types TEXT,
  specific_methods_tools_techniques TEXT,
  primary_org_id BIGINT,
  missing_org TINYINT,
  missing_methods TINYINT,
  missing_country TINYINT
);

-- DIMENSIONS
CREATE TABLE dim_methods (
  method_id BIGINT PRIMARY KEY,
  type VARCHAR(50),
  post_date VARCHAR(50),
  updated_date VARCHAR(50),
  published VARCHAR(20),
  original_language VARCHAR(50),
  method_types TEXT,
  purpose_method TEXT,
  public_spectrum TEXT,
  level_complexity TEXT,
  recruitment_method TEXT,
  typical_purposes TEXT,
  scope_of_influence TEXT,
  decision_methods TEXT,
  completeness TEXT,
  collections TEXT
);

CREATE TABLE dim_organisations (
  org_id BIGINT PRIMARY KEY,
  type VARCHAR(50),
  title TEXT,
  url TEXT,
  post_date VARCHAR(50),
  updated_date VARCHAR(50),
  creator_id BIGINT,
  creator_name TEXT,
  city VARCHAR(200),
  province VARCHAR(200),
  country VARCHAR(200),
  sector TEXT,
  scope_of_influence_1 TEXT,
  scope_of_influence_2 TEXT,
  scope_of_influence_3 TEXT,
  type_method_1 TEXT,
  type_method_2 TEXT,
  type_method_3 TEXT,
  type_tool_1 TEXT,
  type_tool_2 TEXT,
  type_tool_3 TEXT,
  specific_topics_1 TEXT,
  specific_topics_2 TEXT,
  specific_topics_3 TEXT,
  general_issues_1 TEXT,
  general_issues_2 TEXT,
  general_issues_3 TEXT,
  specific_methods_tools_techniques TEXT,
  collections TEXT
);

-- BRIDGES (avoid many-to-many issues)
CREATE TABLE bridge_case_method (
  case_id BIGINT,
  method_id BIGINT,
  PRIMARY KEY (case_id, method_id)
);

CREATE TABLE bridge_case_org (
  case_id BIGINT,
  org_id BIGINT,
  PRIMARY KEY (case_id, org_id)
);