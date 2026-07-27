# 📊 Customer Engagement Analysis with SQL & Tableau

An end-to-end Data Science and Business Analytics project evaluating student onboarding efficiency, content consumption trends, and geographic growth for an online learning platform. 

This project demonstrates pre-aggregated data extraction using **SQL** and multi-page interactive visualization in **Tableau Public**.

🔗 **[View Interactive Dashboard on Tableau Public](https://public.tableau.com)** *(Replace with your published Tableau link)*

---

## 📌 Executive Summary & Key Insights

* **Engagement Gap:** Paying subscribers average ~685 minutes/month actively learning, compared to ~28 minutes for active free-tier users.
* **Geographic Breakdown:** The US and India account for the largest student concentration, with US learners leading overall platform watch time.
* **Onboarding Conversion:** ~51.8% of newly registered users complete the platform onboarding process, maintaining a steady conversion trend over time.

---

## 📈 Key Performance Indicators (KPIs)

| KPI Name | Dashboard Location | Calculation / Logic | Business Context |
| :--- | :--- | :--- | :--- |
| **Total Registered Students** | Page 1 | `SUM(total_registered)` | Tracks top-of-funnel student acquisition volume over time. |
| **Total Minutes Watched** | Page 1 | `SUM(total_minutes_watched)` | Measures total content consumption and platform usage. |
| **Avg. Minutes per Active User** | Page 1 | `SUM(total_minutes_watched) / SUM(active_watching_students)` | Evaluates student engagement depth among active learners. |
| **Onboarding Conversion Rate** | Page 3 | `SUM(total_onboarded) / SUM(total_registered)` | Measures the efficiency of converting new registrations into onboarded students. |

---

## 🎛️ Technical & Interactive Features

* **Dynamic `Top N` Parameter Control:** Allows users to dynamically change the number of top courses rendered on Page 1 (e.g., Top 5, Top 10, Top 15).
* **Geographic Cross-Filtering:** Selecting a country on the global map (Page 2) dynamically updates regional user counts and watch-time funnels.
* **Custom Calculated Fields:** 
  * `Not Onboarded Students` = `[total_registered] - [total_onboarded]` (used for stacked bar display).
  * `Overall Onboarding Rate` = `SUM([total_onboarded]) / SUM([total_registered])`.
* **Multi-Page Dashboard Architecture:** Integrated native navigation buttons allowing seamless switching between Executive Overview, Geographic Trends, and Onboarding Analytics.

---

## 📂 Repository Structure

```text
├── README.md                          <-- Project overview & documentation
├── dashboards/
│   └── Customer_Engagement_Analysis.twbx <-- Tableau Packaged Workbook file
├── sql/
│   ├── 01_top_courses.sql             <-- Course popularity aggregations
│   ├── 02_onboarding.sql              <-- Monthly registration vs onboarding queries
│   ├── 03_engagement.sql              <-- Free vs paid student metrics
│   ├── 04_seasonality.sql             <-- Monthly growth & watch time metrics
│   └── 05_geographic.sql              <-- Regional user counts & total watch time
└── data/
    ├── sql_q1.csv
    ├── sql_q2.csv
    ├── sql_q3.csv
    ├── sql_q4.csv
    └── sql_q5.csv
