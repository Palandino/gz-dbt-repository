with marge_oper_order AS (

Select
    key1.date_date,
    key1.orders_id,
    key1.order_revenue,
    key1.order_quantity,
    key1.order_purchase,
    key1.order_margin,
    key2.shipping_fee,
    key2.logcost,
    key2.ship_cost
from {{ ref('int_orders_margin') }} AS key1
inner join {{ ref('stg_gz_raw_data__gz_ship') }} AS key2
on key1.orders_id = key2.orders_id

)
SELECT  
    date_date,
    orders_id,
    order_revenue,
    order_quantity,
    order_purchase,
    order_margin,
    shipping_fee,
    logcost,
    ship_cost,
    ROUND(shipping_fee+logcost+ship_cost,2) AS oper_cost,
    round(order_revenue-shipping_fee-logcost-ship_cost,2) AS oper_margin
FROM marge_oper_order
