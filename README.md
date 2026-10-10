# 🛒 E-commerce Sales Analytics (PostgreSQL + Python)

End-to-end data analysis on 540K+ transactions of a UK-based online retail store. Analysis covers sales trends, customer segmentation, and business insights using advanced SQL.

## 🎯 Problem Statement

E-commerce store ko apne customer behavior aur sales patterns samajhna hai taaki:
- High-value customers identify kiye ja sakein
- Churn risk wale customers ko target kiya ja sake
- Inventory aur marketing strategy improve ki ja sake

## 📊 Dataset

- **Source**: [UCI Online Retail Dataset](https://www.kaggle.com/datasets/carrie1/ecommerce-data)
- **Size**: 541,909 transactions
- **Period**: Dec 2010 - Dec 2011

## 🛠️ Tech Stack

- **Database**: PostgreSQL 18
- **Language**: Python 3.12
- **Libraries**: Pandas, SQLAlchemy, Matplotlib, Seaborn
- **Tools**: pgAdmin 4, VS Code, Git

## 🔍 SQL Skills Demonstrated

- **CTEs** for complex query organization
- **Window Functions**: NTILE, RANK, LAG
- **Date Functions**: DATE_TRUNC, TO_CHAR, EXTRACT
- **Aggregations** with GROUP BY
- **Conditional Logic** with CASE

## 📈 Key Analyses

1. **Monthly Revenue Trend** — Seasonality analysis
2. **Top Countries (Excluding UK)** — International markets
3. **Top Products** — Best sellers
4. **RFM Customer Segmentation** — 5 customer segments identified
5. **Month-over-Month Growth** — Using LAG window function

## 💡 Key Insights

| Segment | Customers | Revenue | Recommendation |
|---------|-----------|---------|----------------|
| Loyal | 839 | ₹15.2L | Upsell + loyalty |
| At Risk | 539 | ₹8.5L | Win-back campaign |
| Lost | 910 | ₹2.0L | Skip investment |
| New Customers | 654 | ₹2.2L | Onboarding |

## 📁 Project Structure
