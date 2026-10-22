{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
    employee_id AS emp_key,
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    position,
    hire_date
FROM {{ source('oliver_landing', 'employee') }}