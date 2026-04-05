with staging_orders as (
    select * from {{ ref('orders_staging') }}
),

cleaned_orders as (
    select
        order_id,
        customer_id,
        product_id,
        
        -- Standardize order status to lowercase for consistency
        lower(trim(status)) as order_status,
        
        -- Ensure dates are actually date/timestamp types
        cast(order_date as timestamp) as order_placed_at,
        quantity

    from staging_orders
    
)

select * from cleaned_orders