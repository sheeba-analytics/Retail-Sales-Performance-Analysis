# Retail Business Performance Analysis

## Project Overview
This project analyzes retail product data to understand sales performance, pricing strategies, and customer value perception across product categories.

The analysis focuses on identifying which categories and products drive the most revenue, how discounts influence pricing strategies, and how customer ratings relate to product pricing. Insights are presented through an interactive Power BI dashboard supported by Python data preparation and SQL validation.

## Business Problem

Retail businesses manage large product catalogs and complex pricing strategies. However, identifying which products truly drive revenue and customer value can be challenging.

High discounts do not always lead to higher customer satisfaction or profitability. Some categories contain many products but generate relatively low sales, while others generate strong revenue with fewer items.

Without clear insights, pricing strategies and product promotions may not effectively support business growth. This project analyzes pricing, discounts, ratings, and value metrics to support data-driven retail decision-making.

## Project Objectives
- Analyze product distribution and sales performance across categories
- Evaluate discount strategies and pricing effectiveness
- Identify high-performing and high-value products
- Compare product ratings with pricing levels
- Validate business metrics using SQL

## End-to-End Data Pipeline

Raw Files → Python → SQL → Power BI

Python was used for data cleaning and preparation.
SQL was used for validating business logic and metrics.
Power BI was used for interactive data visualization and dashboard creation. 

## Dashboard Preview
### Sales Overview
![Sales Overview](screenshots/sales_overview.png)

### Category Performance Analysis
![Category Performance Analysis](screenshots/category_performance_analysis.png)

### Discount Strategy Analysis
![Discount Strategy Analysis](screenshots/discount_strategy_analysis.png)

### Value Score Analysis
![Value Score Analysis](screenshots/value_score_analysis.png)

### Rating Analysis
![Rating Analysis](screenshots/rating_analysis.png)

## Key Insights
- Total sales amount to 261.96M, indicating strong overall revenue scale.
- The product catalog contains 237K products, showing a wide product assortment.
- The average customer rating is 3.81, reflecting generally positive customer feedback.
- The average discount rate is 55.19%, indicating a heavily discount-driven pricing strategy.
- Discounts alone do not always translate to higher value perception among customers.
- Some categories generate high sales despite having fewer products, indicating stronger demand efficiency.

## Recommendations
- Focus marketing and promotions on high-value and highly rated products.
- Promote products with strong value scores to improve customer satisfaction.
- Reduce excessive discounting in categories where discounts do not significantly improve perceived value.
- Use customer reviews and ratings to guide pricing and product assortment decisions. 

## Tools Used
- Python (Pandas, NumPy) – Data cleaning and preparation
- SQL – Data validation and business metric verification
- Power BI – Data visualization and dashboard development

## Project Structure

retail-business-performance-analysis
│
├── data – dataset used for analysis
├── python – data cleaning and preparation scripts
├── sql – SQL queries for validation and analysis
├── powerbi – Power BI dashboard file
├── screenshots – dashboard preview images
├── presentation – project presentation slides
│
└── README.md – project documentation
