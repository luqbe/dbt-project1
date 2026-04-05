with orders as (
    select * from {{ ref('orders_intermediate') }}
),

customer as (
    select * from {{ ref('customer_intermediate') }}
),

products as (
    select * from {{ ref('products_intermediate') }}
)

select 
    -- Order Information (The central facts)
    o.order_id,
    o.customer_id,
    o.product_id,
    o.order_status,
    o.order_placed_at,

    -- Customer Information (Who made the order)
    
    c.customer_name,
    c.city,
    c.email_address,
    

    -- Product Information (What was ordered)
    
    p.product_name,
    p.product_category,
    p.price as product_base_price,
    p.is_in_stock as is_product_currently_in_stock,

    -- Business Logic: Did they get a discount?
    case 
    when order_status = 'completed' then 'finished'
    when order_status = 'pending' then 'waiting'
    else 'rejected' -- or whatever 'false' represents
end as order_status_review

from orders o
-- We use LEFT JOINs to ensure we don't lose an order even if 
-- a customer or product record is accidentally missing
left join customer c
    on o.customer_id = c.customer_id
left join products p
    on o.product_id = p.product_id