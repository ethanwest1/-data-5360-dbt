{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
    d.date_day        AS order_date,
    d.year_number     AS order_year,
    d.month_name      AS order_month,
    d.day_of_week,
    f.order_id,
    s.store_name,
    s.city            AS store_city,
    s.state           AS store_state,
    e.first_name      AS employee_first_name,
    e.last_name       AS employee_last_name,
    c.first_name      AS customer_first_name,
    c.last_name       AS customer_last_name,
    c.state           AS customer_state,
    p.product_name,
    f.quantity,
    f.unit_price,
    f.dollars_sold
FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref('oliver_dim_date') }}     d ON f.date_key    = d.date_key
LEFT JOIN {{ ref('oliver_dim_store') }}    s ON f.store_key   = s.store_key
LEFT JOIN {{ ref('oliver_dim_employee') }} e ON f.emp_key     = e.emp_key
LEFT JOIN {{ ref('oliver_dim_customer') }} c ON f.cust_key    = c.cust_key
LEFT JOIN {{ ref('oliver_dim_product') }}  p ON f.product_key = p.product_key