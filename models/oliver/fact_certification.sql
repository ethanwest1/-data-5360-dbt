{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    e.emp_key,
    d.date_key,
    s.certification_name,
    s.certification_cost
from {{ ref('stg_employee_certifications') }} s
inner join {{ ref('oliver_dim_employee') }} e
    on s.employee_id = e.employee_id
inner join {{ ref('oliver_dim_date') }} d
    on s.certification_awarded_date = d.date_key