WITH margin AS (
select
    sales.date_date,
    sales.orders_id,
    sales.product_id,
    sales.revenue,
    sales.quantity,
    purchase.purchase_price
from {{ ref('stg_gz_raw_data__gz_sales') }} AS sales
    LEFT JOIN {{ ref('stg_gz_raw_data__gz_product') }} AS purchase
on sales.product_id = purchase.products_id

)
Select
    date_date,
    orders_id,
    product_id,
    revenue,
    quantity,
    purchase_price,
    ROUND(revenue-(purchase_price*quantity),2) AS margin
from margin
