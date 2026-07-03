# Marketing Campaign Analytics

End-to-end customer & marketing-campaign analytics for a retail company: data cleaning and
exploratory analysis in **Python**, a **PostgreSQL** data model with analytical queries and
views, rule-based **customer segmentation**, and an interactive **Power BI** dashboard.

**Stack:** Python (Pandas, NumPy, Matplotlib, Seaborn) · PostgreSQL · Power BI
**Dataset:** 56,000 customers × 28 fields — demographics, product spend, channel purchases, and campaign responses.

---

## Business questions

1. Which customer segments respond best to campaigns (overall and per campaign)?
2. How does product spending vary by age, income, marital status, and country?
3. Which channels do high-value customers use, and how often do they visit the site?
4. Which segments are under-served (low spend, high visits, low response)?
5. What defines the **ideal target customer** for future campaigns?

---

## Key findings

- **Income is the #1 response driver** — response rate climbs from **4.6%** (under 25k) to **27.8%** (100k+), a ~6× jump.
- **Childless customers respond ~2× more** than families (21.5% vs 11.6%).
- **Wine + Meat = ~80% of all product revenue**; other categories are minor.
- **Campaign 2 failed** (1.4% acceptance) — ~10× worse than the best campaign; the last campaign and Campaign 1 were the top performers (~14%).
- **High-value customers favour Store & Catalog** and visit the website *less* — heavy web-visiting correlates *negatively* with spend and response (browse-not-buy).
- **A quarter of the base (~25.5%) is under-served** — high web visits, below-median spend, and no campaign accepted.

**Most valuable segments:** *High Spender* (26% response, ₹1,972 avg spend) and *High Income* (23.5% response) — small but high-value. The largest segments (Family, High Web Engagement) under-perform, so **size ≠ value**.

**Ideal target customer:** high income (75k+), no children, 50+, already a high spender, reached via catalog/store.

---

## Project structure

```
marketing-campaign-analytics/
├── 01-cleaning.ipynb        # Load, clean, and engineer 9+ derived features
├── 02_EDA.ipynb             # Univariate, bivariate & multivariate analysis (11 charts)
├── 03_segmentation.ipynb    # Six rule-based segments + KPI comparison
├── 04_sql.ipynb             # Load data into PostgreSQL and run analytical queries
├── sql/
│   ├── 01_schema.sql        # DDL — customers table
│   ├── 03_queries.sql       # Analytical queries (GROUP BY, CASE, window functions)
│   └── 04_views.sql         # Dashboard views
├── data/
│   ├── marketing_data.csv            # Raw dataset
│   └── marketing_data_dictionary.csv # Field descriptions
├── Marketing Campaign Dashboard.pbix # Power BI dashboard
├── report/                           # Project report (findings + recommendations)
└── README.md
```

> The cleaned (`marketing_clean.csv`) and segmented (`marketing_segmented.csv`) datasets are
> **generated** by running notebooks `01` and `03`.

---

## How to run

1. **Python** — `pip install pandas numpy matplotlib seaborn sqlalchemy psycopg2-binary jupyter`, then run the notebooks in order (`01` → `04`).
2. **SQL** — a PostgreSQL instance with a `marketing` database; notebook `04` loads the data and runs the queries. The `.sql` files are the standalone scripts.
3. **Dashboard** — open `Marketing Campaign Dashboard.pbix` in Power BI, or view it in Power BI Service.

---

## Recommendations

1. Target the **high-income, childless** core with **wine + meat** bundles.
2. **Retire/redesign Campaign 2**; clone the last campaign and Campaign 1.
3. Prioritise **Catalog & Store** for high-value customers, not discount deals.
4. Convert the **25.5% under-served** browsers with entry-priced offers and onboarding.
5. Down-weight blanket **family targeting**; shift premium spend to childless high-income groups.
6. Treat heavy web-visiting as a **browse-not-buy** signal — trigger targeted offers.

---

## Author

**Jeffrey Gabriel** — Full Stack Developer & Data Science
