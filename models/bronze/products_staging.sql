with raw_seed as (
    -- Call the seed using ref()
    select * from {{ ref('products') }}
),

staged_seed as (
    select
        
        *
        
    from raw_seed
)

select * from staged_seed