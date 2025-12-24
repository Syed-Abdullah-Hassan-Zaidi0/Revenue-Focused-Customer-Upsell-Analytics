# 📈 Revenue-Focused Customer Upsell Analytics
<img width="1317" height="773" alt="image" src="https://github.com/user-attachments/assets/46fe28e4-7093-40d4-acf8-a2e64125114a" />


## 🧩 Problem Statement

Telecom companies already have a large customer base, but sustainable revenue growth depends on identifying **existing customers who are most likely to upgrade plans or purchase add-on services**.

While most telecom analytics projects focus on **churn prediction**, this project takes a **revenue-oriented approach**:

> **Which existing customers should we target for upselling?**

---

## 🎯 Project Objective

The primary goals of this project are to:

- Identify **high-potential customers** for upsell  
- Assign **upsell probability and priority levels**  
- Help business teams focus efforts on **revenue-generating customers**  
- Deliver **actionable business insights**, not just model predictions  

🚫 **Not a churn prediction project**  
✅ **Upsell Opportunity Prediction project**

---

## 🛠️ Tools & Technologies Used

### Programming & Analytics
- Python (Jupyter Notebook)
- pandas, numpy
- scikit-learn
- matplotlib

### Machine Learning
- Decision Tree Classifier

### Database & Querying
- SQL
- SQLite

### Visualization
- Power BI

---

## 📂 End-to-End Project Workflow

### 🔹 Phase 1: Dataset & Understanding

- Used a **Telecom Customer Dataset**
- Key attributes included:
  - Customer tenure
  - Monthly charges & total charges
  - Contract type
  - Payment method
  - Internet services
  - Churn indicators  
    *(Used only as business logic, not as prediction target)*

---

### 🔹 Phase 2: Data Cleaning & Preparation (Jupyter Notebook)

Steps performed:

- Renamed columns for consistency  
  - Example: `Churn Value` → `churn_value`
- Handled numerical and categorical data types
- Removed unnecessary columns
- Checked and handled missing values
- Converted categorical variables using **One-Hot Encoding**

---

### 🔹 Phase 3: Exploratory Data Analysis (EDA)

Performed EDA to understand:

- Customer tenure distribution
- Monthly charges patterns
- Relationships between:
  - Tenure
  - Charges
  - Upsell potential
- Business intuition behind identifying upsell candidates

---

### 🔹 Phase 4: Upsell Target Definition (Business Logic)

Since the dataset had **no direct upsell label**, a **business-driven target variable** was created.

#### Upsell Candidate Logic

A customer is considered a **high upsell candidate** if:

- Customer has **not churned** (`churn_value = 0`)
- Has **higher monthly charges**
- Has **longer tenure**

This resulted in a **binary target variable**:

| Value | Meaning               |
|------|-----------------------|
| 1    | High Upsell Potential |
| 0    | Low Upsell Potential  |

---

### 🔹 Phase 5: Machine Learning Model (Decision Tree)

#### Why Decision Tree?
- Easy to explain to business stakeholders
- Highly interpretable rules
- Preferred over black-box models for analytics roles

#### Model Steps
- Train-test split
- Trained a **Decision Tree Classifier**
- Controlled tree depth to avoid overfitting

#### Model Outputs
- `upsell_probability`
- `upsell_prediction`
- `upsell_priority` (High / Medium / Low)

**Bonus:**
- Visualized the Decision Tree
- Extracted **Feature Importance** to explain upsell drivers

---

### 🔹 Phase 6: SQL Integration

#### Why SQL?
- Simulates real-world analytics workflow
- Model outputs are often stored in databases
- Enables business users to query data without Python

#### What Was Done
- Exported model predictions to **SQLite**
- Created table: `upsell_predictions`
- Wrote business-focused SQL queries such as:
  - High upsell potential customers
  - Revenue-focused segments
  - Upsell priority analysis
- Prepared **Power BI–ready tables**

---

### 🔹 Phase 7: Power BI Visualization

Designed an **executive-friendly Power BI dashboard** focused on **business insights**, not ML metrics.

#### Key Visuals
- 📋 Top Upsell Customers Table
- 📊 Upsell Priority Distribution
- 💰 Revenue vs Upsell Probability
- ⏳ Tenure vs Upsell Insights

🎯 **Design Focus**
- Actionable insights
- Clear priorities
- Easy interpretation for non-technical stakeholders

---

## 📊 Key Business Insights

- Customers with **longer tenure** and **higher monthly charges** show stronger upsell potential
- Upsell opportunities are **not evenly distributed**
- A small customer segment contributes **disproportionately to revenue potential**
- Decision Trees clearly explain **why** a customer is a good upsell target

---

## 🚀 What This Project Demonstrates

- End-to-end **Data Analytics workflow**
- Business thinking beyond churn prediction
- Beginner-friendly **Machine Learning**
- SQL integration with analytics pipelines
- Professional **Power BI dashboarding**
- Clear communication of insights to stakeholders

---

## 📌 Conclusion

This project showcases how **analytics and machine learning can drive revenue growth**, not just reduce losses.

By focusing on **upsell opportunities**, it aligns technical modeling with **real-world business impact**.




------------------------------------------------------------------------------------------------------------------

## 📁 Project Structure

├── data/
│ └── Teleco_customer_churn
│
├── notebook_SQL/
│ ├── Revenue_Analysis.ipynb
│ ├── upsell.db
│ ├── queries.sql
│ └── upsell_predictions.csv
│
├── powerbi/
│ ├── upsell_powerbi.csv
│ └── Upsell_Powerbi.pbix




---

## 📂 Folder & File Description

### 📁 `data/`
Contains the raw dataset used for analysis and modeling.

- **Teleco_customer_churn**  
  Original telecom customer dataset containing customer demographics, services, tenure, charges, and churn-related fields.  
  This dataset is used **only for analysis and business logic**, not for churn prediction.

---

### 📁 `notebook_SQL/`
This folder contains the **core analytics and modeling workflow**, along with SQL integration.

- **Revenue_Analysis.ipynb**  
  Main Jupyter Notebook covering:
  - Data cleaning and preprocessing  
  - Exploratory Data Analysis (EDA)  
  - Business logic for upsell target creation  
  - Decision Tree model training  
  - Upsell probability, prediction, and priority assignment  

- **upsell.db**  
  SQLite database storing model outputs and transformed data, simulating a real-world analytics pipeline.

- **queries.sql**  
  SQL queries written for:
  - Identifying high upsell potential customers  
  - Revenue-focused customer segmentation  
  - Upsell priority analysis  

- **upsell_predictions.csv**  
  Exported model predictions including:
  - Upsell probability  
  - Upsell prediction (0/1)  
  - Upsell priority (High / Medium / Low)  
  Used for SQL analysis and Power BI reporting.

---

### 📁 `powerbi/`
Contains files used for **business-focused visualization and reporting**.

- **upsell_powerbi.csv**  
  Cleaned, Power BI–ready dataset.

- **Upsell_Powerbi.pbix**  
  Interactive Power BI dashboard featuring:
  - Top upsell customers  
  - Upsell priority distribution  
  - Revenue vs upsell probability  
  - Tenure-based upsell insights  

  Designed for **non-technical stakeholders and business teams**.

---

