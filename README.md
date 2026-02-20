# Coffeeclub_Promotional_Data_Migration
Production-style data pipeline demonstrating ETL design, data modelling, and analytics views using Python and PostgreSQL. Focused on promotional campaign migration and business reporting workflows.

## Project Overview

This project focuses on the post-migration optimization, normalization, and analytical enhancement of the CoffeeClub promotional dataset.

The objective was to:

- Enforce structural integrity using constraints
- Normalize the schema in line with Second Normal Form (2NF)
- Improve query performance using indexing
- Engineer analytical features
- Create reusable reporting views

The final implementation follows relational database best practices and performance optimization principles.

---

# Repository Structure

Each folder represents a structured phase in the database migration workflow.

---

# 1. Optimization & Constraints

This phase enforces structural integrity and relational correctness.

## Primary Keys

- customers → customer_id
- offers → offer_id
- events → event_id (BIGSERIAL)
- offer_channels → Composite Primary Key (offer_id, channels)

The introduction of `event_id` ensures each event record is uniquely identifiable and eliminates reliance on non-unique attributes.

## Foreign Keys

Relationships enforced:

- events.customer_id → customers.customer_id
- events.offer_id → offers.offer_id
- offer_channels.offer_id → offers.offer_id

This guarantees referential integrity and prevents orphan records.

## Indexing

Indexes were created on high-traffic columns to improve:

- JOIN performance
- Filtering speed
- Aggregation efficiency

PostgreSQL B-Tree indexing was used (default structure), enabling logarithmic search performance rather than full table scans.

---

# 2. Feature Engineering & Data Integrity

This phase improves data quality and analytical usability.

## Age Validation

Unrealistic age values (≥ 118) were set to NULL to prevent analytical distortion.

## Time Transformation

The original `time` column stored numeric hours.

It was transformed into an INTERVAL datatype:

- Converted total hours into days + hours format
- Dropped original column
- Renamed engineered column back to `time`

This improves semantic clarity and analytical accuracy.

---

# 3. Analytics Layer

A reusable view `offer_summary` was created to support business reporting.

## Metrics Computed

- Number of offers received
- Number of offers completed
- Completion rate percentage

To prevent division-by-zero errors, `NULLIF()` was used in the denominator.

The completion rate is calculated as:

(completed / received) × 100

Results are rounded to two decimal places for reporting precision.

This view supports executive-level performance tracking of promotional campaigns.

---

# 4. Demographic Segmentation

Additional analytical features were engineered:

## Income Bucketing

Customers categorized into:

- High Earner (> 80,000)
- Average Earner (> 40,000)
- Low Earner (≤ 40,000)

## Age Group Segmentation

Customers categorized into:

- Young Adults
- Early Mid Age
- Late Mid Age
- Seniors
- Older Seniors

These features enable:

- Targeted marketing analysis
- Customer segmentation
- Revenue distribution studies

---

# Normalization Rationale (2NF)

The schema aligns with Second Normal Form (2NF).

## Implementation Approach

- Each table has a single primary key.
- Non-key attributes fully depend on the entire primary key.
- Composite key used only where logically required (offer_channels).
- Redundant offer and customer attributes are separated from event-level data.

This eliminates:

- Partial dependencies
- Update anomalies
- Redundant storage

The result is a clean, scalable relational design.

---

# Workflow Summary

1. Data Migration
2. Constraint Enforcement
3. Referential Integrity Setup
4. Index Creation
5. Feature Engineering
6. Analytical View Creation
7. Demographic Enrichment

This structured workflow ensures a clear transformation pipeline from raw transactional data to analytics-ready schema.

---

# 5. Group Role Breakdown
Miracle | Optimization & Constraints
Mohammed | Feature Engineering & Data Integrity
Adeboye | Analytics
Crainsor | Demographic Segmentations

# Conclusion

The CoffeeClub database was successfully transformed into:

- A normalized relational schema (2NF compliant)
- A referentially secure database
- A performance-optimized system
- An analytics-ready environment

The implementation demonstrates best practices in:

- Database design
- Constraint management
- Indexing strategy
- Feature engineering
- Analytical modeling