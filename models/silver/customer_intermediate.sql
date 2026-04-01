-- models/silver/slv_customers.sql

with staging_customers as (
    -- 1. Fetch data from your Bronze/Staging model using ref()
    select * from {{ ref('customer_staging') }}
),

cleaned_customers as (
    -- 2. Apply Silver-layer transformations
    select
        customer_id,
        name as customer_name,         
        lower(email) as email_address,            
        city,
        created_at      
    from staging_customers
    where customer_id is not null                 -- Filter out bad records
)

-- 3. Select the final cleaned data
select * from cleaned_customers