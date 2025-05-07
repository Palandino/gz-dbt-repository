Select
    date_date,
    orders_id,
    ROUND(SUM(revenue),2) AS order_revenue,
    ROUND(SUM(quantity),2) AS order_quantity,
    ROUND(SUM(purchase_price),2) AS order_purchase,
    ROUND(SUM(margin),2) AS order_margin
from {{ ref('int_sales_margin') }}
group by orders_id, date_date