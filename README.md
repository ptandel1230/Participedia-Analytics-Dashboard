# Participedia-Analytics-Dashboard

## Project Overview
This project analyzes participatory democracy data from Participedia to understand how civic engagement cases, methods, and organizations vary across geography, time, and participation types.

The dataset is community-contributed and highly unstructured, with missing and inconsistent values. The focus of this project was to clean the data to an analysis-ready level, model it responsibly, and build interactive dashboards that provide meaningful insights without hiding data limitations.

---

## Data Sources
- Participedia Cases
- Participedia Methods
- Participedia Organizations

---

## Data Cleaning
- Cleaned and standardized raw CSV files using Python
- Converted blank and inconsistent values into standardized nulls
- Parsed multi-value fields for exploratory analysis
- Preserved incomplete records instead of dropping data

---

## Data Modeling
- Created SQL views to standardize raw tables into analysis-ready structures
- Used cases as the primary analytical entity
- Analyzed methods and organizations using denormalized fields
- Designed the model to support clear filtering and aggregation in Power BI

---

## Dashboards
### Cases Dashboard
- Total cases and trends over time
- Geographic distribution by country and province
- Case status and decision methods

### Methods Dashboard
- Purpose of methods
- Level of complexity
- Public participation spectrum
- Participant interaction types

### Organizations Dashboard
- Organization activity by sector and geography
- Methods used by organization type

---

## Limitations
- Some fields represent many-to-many relationships but are stored in denormalized formats
- Bridge tables were not fully implemented in the Power BI model
- Contributor and organization names may contain inconsistencies
- These limitations reflect the real-world, community-contributed nature of the dataset

---

## Technologies Used
- Python (pandas)
- SQL (views and joins)
- Power BI (visualization and modeling)

---

## Data Challenges & Limitations
This project works with real-world, community-contributed data that contains substantial missing and inconsistent values. 
As a result, not all entities could be reliably connected using strict relational joins. 
Rather than forcing assumptions, the model preserves incomplete records and highlights trends at an aggregate level.
Further normalization and entity resolution would be recommended in a production environment.
