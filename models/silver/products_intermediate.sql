with staging_products as (
    select * from {{ ref('products_staging') }}
),

cleaned_products as (
    select
        product_id,
        -- Standardize text fields
        trim(product_name) as product_name,
        lower(trim(category)) as product_category,
        
        -- Ensure price is a clean decimal/numeric value
        cast(price as decimal(10,2)) as price,
        
        -- Handle missing stock quantities by defaulting to 0
        coalesce(cast(stock_qty as integer), 0) as stock_qty,
        -- Create a simple boolean flag for in-stock items using the macro
        {{ is_in_stock('stock_qty') }} as is_in_stock

    from staging_products
    
)

select * from cleaned_products