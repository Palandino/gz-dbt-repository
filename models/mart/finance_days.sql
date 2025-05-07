SELECT 
    date_date,
    count(orders_id) AS nb_transactions,
    sum(order_revenue) AS revenue,
    sum(order_revenue)/count(orders_id) AS average_basket, 
    sum(order_margin) AS margin,
    sum(oper_margin) AS operating_margin,
    sum(order_purchase) AS total_purchase_cost,
    sum(shipping_fee) AS total_shipping_fees,
    sum(logcost) AS total_log_costs,
    sum(quantity) AS quantity_product_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY 
    date_date
