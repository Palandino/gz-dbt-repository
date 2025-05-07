with 

source as (

    select * from {{ source('gz_raw_data', 'gz_ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost AS INTEGER) AS ship_cost

    from source

)

select * from renamed
