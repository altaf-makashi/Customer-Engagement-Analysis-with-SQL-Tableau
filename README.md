# 📊 Customer Engagement Analysis with SQL & Tableau

An end-to-end Data Science and Business Analytics project evaluating student onboarding efficiency, content consumption trends, and geographic growth for an online learning platform. 

This project demonstrates pre-aggregated data extraction using **SQL** and multi-page interactive visualization in **Tableau Public**.

🔗 **[View Interactive Dashboard on Tableau Public](https://public.tableau.com/app/profile/altaf.makashi/viz/CustomerEngagmentAnalysis/Page1-ExecutiveOverview_)
**

---
## 📌 Business Questions & Key Insights

* **1. Course Popularity & Ratings:**
  * Top-performing courses drive the majority of platform watch time, with core career track courses (such as SQL, Python, and Tableau fundamentals) capturing the highest student engagement and positive user feedback.

* **2. Monthly Registrations & Onboarding Conversion:**
  * Platform registrations show steady growth over time, with an overall onboarding completion rate of **~51.8%**. Onboarding conversion fluctuates monthly between **46% and 65%**, indicating consistent top-of-funnel conversion with room to optimize onboarding workflows.

* **3. Engagement by Student Tier (Free vs. Paying):**
  * Paying subscribers demonstrate significantly deeper engagement than free-tier users, averaging **~685 minutes/month** per active learner compared to only **~28 minutes/month** for active free-plan students.

* **4. Geographic User Distribution vs. Watch Time:**
  * India leads in total user volume (**6,933 registered students**), followed by the United States (**4,768 registered students**). 
  * **Non-Proportional Scaling:** User counts do *not* scale proportionally with watch time. While India has more total users, United States learners generate the highest total watch time (**~449,000 minutes** vs. **~181,000 minutes** for India), showing a much higher average watch duration per user in North America. 
---

## 📈 Key Performance Indicators (KPIs)

| KPI Name | Dashboard Location | Calculation / Logic | Business Context |
| :--- | :--- | :--- | :--- |
| **Total Registered Students** | Page 1 & 2 | `SUM(total_registered)` | Tracks top-of-funnel student acquisition volume over time. |
| **Total Minutes Watched** | Page 1 | `SUM(total_minutes_watched)` | Measures total content consumption and platform usage. |
| **Avg. Minutes per Active User** | Page 1 | `SUM(total_minutes_watched) / SUM(active_watching_students)` | Evaluates student engagement depth among active learners. |
| **Onboarding Conversion Rate** | Page 2 | `SUM(total_onboarded) / SUM(total_registered)` | Measures the efficiency of converting new registrations into onboarded students. |

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
