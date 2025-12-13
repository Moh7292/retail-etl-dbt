# 📊 Retail Dashboard – Power BI

## 🎯 Objectif
Ce dashboard Power BI permet d’analyser la performance des ventes e-commerce à partir
des tables analytiques générées par dbt dans BigQuery.

Il s’adresse aux équipes **business**, **marketing** et **direction**.

---

## 🔗 Source des données
Les données proviennent du dataset BigQuery alimenté par dbt :

### Tables utilisées
- `fct_invoices`
- `dim_customer`
- `dim_product`
- `dim_datetime`

---

## 📈 KPIs principaux
- Chiffre d’affaires total
- Nombre de factures
- Panier moyen
- Quantité vendue
- Top produits
- Répartition géographique des ventes

---

## 📆 Axes d’analyse
- Temps (jour / mois / année)
- Produits
- Clients
- Pays

---

## 🛠️ Détails techniques
- Connexion Power BI → BigQuery
- Utilisation du connecteur BigQuery (mode legacy)
- Modèle en étoile basé sur les marts dbt
- Mesures DAX optimisées pour la performance

---

## 📷 Aperçu
Voir le dossier `screenshots/` pour un aperçu du dashboard.

## 📷 Aperçu du dashboard

### 🔹 Vue globale
[![Vue globale](screenshots/overview.png)](screenshots/overview.png)

### 🔹 Analyse clients
[![Analyse clients](screenshots/customers_view.png)](screenshots/customers_view.png)

### 🔹 Analyse produits
[![Analyse produits](screenshots/products_view.png)](screenshots/products_view.png)


