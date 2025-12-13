# 🛒 Retail ELT Pipeline – dbt on GCP

## Objectif du projet
Ce projet met en œuvre un **pipeline ELT retail complet** sur **Google Cloud Platform**, depuis des données e-commerce brutes jusqu’à des tables analytiques exploitées dans Power BI.

L’objectif est de démontrer une **approche Analytics Engineer**, orientée qualité des données, modélisation et exploitation métier.

##  Architecture globale

CSV / Raw tables  
→ BigQuery (raw & staging)  
→ dbt (transformations SQL)  
→ BigQuery (tables analytiques)  
→ Power BI (dashboard final)

---

##  Stack technique
- **Cloud** : Google Cloud Platform (GCP)
- **Data Warehouse** : BigQuery
- **Transformation** : dbt
- **CI/CD** : Cloud Build
- **Containerisation** : Docker
- **Langages** : SQL, Python
- **BI** : Power BI

---

##  Dataset
- **Nom** : Online Retail
- **Source** : UCI Machine Learning Repository
- **Période** : 2010 – 2011
- **Contenu** : Transactions e-commerce réelles (produits, clients, dates, montants)

---

##  Structure du projet

```text
models/
├── staging/
│   └── sources.yml
│
├── transform/
│   ├── dim_customer.sql
│   ├── dim_datetime.sql
│   ├── dim_product.sql
│   └── fct_invoices.sql
