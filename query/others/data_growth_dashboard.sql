create table public.data_growth as (
    SELECT
        DISTINCT
        loc.country as contact_country
        ,cont.title
        ,dpt.department_name as department
        ,sen.seniority_name as seniority
        ,cmp.company_website
        ,locc.country as company_country
        ,ind.industry_name
        ,emp.employee_size_name
        ,rev.revenue_range
        ,cont.last_update_date::date as contact_ingest_date
        ,cmp.last_update_date::date as company_ingest_date
    FROM ig_production.contact cont
    INNER JOIN ig_production.company cmp
        ON cont.company_id = cmp.company_id
    INNER JOIN ig_master.location loc
        ON cont.location_id = loc.location_id
    INNER JOIN ig_master.location locc
        ON cmp.location_id = loc.location_id
    INNER JOIN ig_master.department dpt
        ON cont.department_id = dpt.department_id
    LEFT JOIN ig_master.job_function jf
        ON cont.job_function_id = jf.job_function_id
    LEFT JOIN ig_master.job_role jr
        ON cont.job_role_id = jr.job_role_id
    INNER JOIN ig_master.seniority sen
        ON cont.seniority_id = sen.seniority_id
    INNER JOIN ig_master.employee_size emp
        ON cmp.employee_size_id = emp.employee_size_id
    INNER JOIN ig_master.revenue_range as rev
        ON cmp.revenue_range_id = rev.revenue_range_id
    INNER JOIN ig_master.industry ind
        ON cmp.industry_id = ind.industry_id
    LEFT JOIN ig_master.subindustry sub
        ON cmp.subindustry_id = sub.subindustry_id
)