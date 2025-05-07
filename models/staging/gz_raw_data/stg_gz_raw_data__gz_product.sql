with 

source as (

    select * from {{ source('gz_raw_data', 'gz_product') }}

),

renamed as (

    select
        products_id,
        CAST(purchse_price AS FLOAT64) AS purchase_price

    from source

)

select * from renamed
