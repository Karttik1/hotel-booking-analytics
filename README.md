# Hotel Booking Analytics Dashboard



An end-to-end analysis of 119,202 hotel bookings (2015-2017) covering booking demand, pricing and cancellations, built with Python, MySQL and Power BI.



# Business Question

Which customer segments and hotels drive bookings, and where is the business losing revenue to cancellations?



# Dashboard

[Dashboard](dashboard.png)



# Key Findings

- Groups have the highest cancellation rate at 61%, against 37% overall.

- City Hotel cancels 42% of bookings vs 28% at Resort Hotel, about 1.5x higher.

- Online TA is the largest channel with 56K bookings, roughly 47% of the total.

- Bookings peak in July and August(12.6K and 13.9K) and are lowest in January.

- Portugal (PRT) is the top market with about 48K bookings, well ahead of GBR (12K).

- Average lead time is 104 days, and only 3.15% of bookings are from repeat guests.



# Suggested Actions

- Review deposit or cancellation terms for Group bookings.

- Look into why City Hotel's cancellation rate is higher than Resort's.

-0 Plan staffing and pricing around the July-August peak.



# Tools Used

- Python (Pandas): [describe your cleaning steps, e.g. fixing nulls, removing invalid rows]

- MySQL: 15 analytical queries using CTEs, window functions (RANK, DENSE\_RANK, LAG) and correlated subqueries

- Power BI: KPI cards, interactive slicers, DAX measures (cancellation rate, average ADR, estimated revenue) and a custom month sort order



# Project Files

- `hotel_bookings_cleaned.csv`: cleaned dataset

- `Hotel_Booking.sql`: all SQL queries

- `Hotel_Bookings_Dashboard.pbix`: Power BI file

- `dashboard.png`: dashboard screenshot



# Notes

- Total Revenue is an estimate (ADR x total nights stayed).

- The dataset doesn't state a currency, so ADR is shown without a symbol.

- Dataset source: [add the source, e.g. the Kaggle "Hotel Booking Demand" dataset].

