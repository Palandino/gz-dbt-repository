{{ config(materialized='table') }}


SELECT 
    date_date,
    count(orders_id) AS nb_transactions,
    ROUND(sum(order_revenue),2) AS revenue,
    ROUND(sum(order_revenue)/count(orders_id),2) AS average_basket, 
    ROUND(sum(order_margin),2) AS margin,
    ROUND(sum(oper_margin),2) AS operating_margin,
    ROUND(sum(order_purchase),2) AS total_purchase_cost,
    ROUND(sum(shipping_fee),2) AS total_shipping_fees,
    ROUND(sum(logcost),2) AS total_log_costs,
    ROUND(sum(order_quantity),2) AS quantity_product_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY 
    date_date
ORDER BY   
    date_date DESC
