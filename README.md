# 📊 US Toy Sales Performance & Inventory Analysis

A comprehensive data analytics project that transitions raw retail data into actionable business insights using **MySQL** for data cleaning and exploration, and **Power BI** for advanced data modeling and interactive dashboard visualization.

---

## 🛠️ Project Workflow

1. **Data Cleaning & Pre-processing (MySQL):** Handled missing values, removed duplicate records, and standardized data types.
2. **Business Analysis (SQL):** Executed advanced SQL queries to solve core business problems regarding revenue, stockout risks, and trends.
3. **Data Modeling (Power BI):** Developed an optimized Star Schema and built a custom DAX Calendar table for seamless time-intelligence capabilities.
4. **Interactive Visualization (Power BI):** Designed a multi-page interactive dashboard mapping high-level executive KPIs and transactional behavior.

---

## 🧹 Phase 1: Data Cleaning & Transformation (MySQL)

Before diving into analysis, the raw dataset was processed using MySQL Workbench to ensure data integrity:
* **Handling Nulls & Blanks:** Validated critical tables (`sales`, `products`, `stores`, `inventory`) and handled missing entries to maintain accurate aggregate calculations.
* **Duplicate Elimination:** Checked and dropped repeating rows based on unique primary IDs to prevent double-counting of transactional records.
* **Data Type Standardization:** Converted raw text date values into proper SQL `DATE` format using `STR_TO_DATE()` and updated column schemas accordingly.

---

## 📊 Phase 2: SQL Business Queries & Insights

### 🛒 Q1: Top Revenue & Profit Generators
* **Business Question:** Which product category makes the highest total revenue, and which category has the highest profit margin?
* **Insight:** **Mega Board Game** (Action Figures category) is the absolute leader, generating approximately **$231.91K** in revenue. While Action Figures bring gross volume, **Collectibles** and **Card Games** record the highest overall profit margin percentages.

### 📍 Q2: Store-wise Sales Performance
* **Business Question:** How much total revenue did each store make based on its city, and what is the average number of units sold per transaction?
* **Insight:** Out of 120 operational branches, **Sunshine Toy Store (Arlington)** leads nationwide revenue, closely followed by **Bluebird Toys**. The baseline ticket size remains highly uniform across the country at an average of **2.31 units sold** per transaction.

### 📅 Q3: Monthly Sales Trend (MoM)
* **Business Question:** What is the Month-on-Month sales trend? In which month do sales peak, and in which month are they the lowest?
* **Insight:** Sales peak dramatically in **March**, with additional sustained high-revenue streams during July, October, and December. Conversely, **February** experiences the sharpest seasonal dip in revenue across the entire timeline.

### 🚨 Q4: Out of Stock Risk (Inventory Check)
* **Business Question:** Which high-demand products have critically low inventory (Stock on Hand less than 10 units) and need urgent reordering?
* **Insight:** A comprehensive **Matrix Visual** grid cross-references stock levels against unit sales. It highlights localized operational stockout anomalies where high-velocity items sit at zero stock in top-performing branches.

### 🛒 Q5: Customer Buying Behavior (Price Elasticity)
* **Business Question:** Do customers buy expensive products in single quantities and cheap products in bulk? What is the correlation between price and units sold?
* **Insight:** The data confirms a strong negative distribution pattern. Low-priced budget items consistently drive volume, averaging **2 to 3 units** per purchase, whereas premium expensive items are strictly bought as single units (**1 unit** per transaction).

---

## 📐 Phase 3: Power BI Data Modeling & Relationships

### 1. Star Schema Architecture
The data model uses an optimized **Star Schema** architecture. The central `sales` fact table is connected to all peripheral dimension tables (`products`, `stores`, and `inventory`) via standard One-to-Many ($1 \rightarrow *$) active relationships.

### 2. Custom DAX Calendar Table
To successfully isolate continuous dates and drive robust temporal charts, a dedicated Calendar dimension was integrated into the schema.
