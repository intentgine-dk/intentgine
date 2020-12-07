SELECT
	DISTINCT
	cont.contact_linkedin_url
	,cont.email_address
	,cont.first_name
	,cont.last_name
	,cont.phone_number as contact_phone_number
	,cont.street_address as contact_street_address
	,loc.city_name as contact_city
	,loc.state_province as contact_state_province
	,loc.country as contact_country
	,cont.postal_code as contact_postal_code
	,cont.title
	,dpt.department_name as department
	,jf.job_function_name as job_function
	,jr.job_role_name as job_role
	,sen.seniority_name as seniority
	,cmp.company_name
	,cmp.company_linkedin_url
	,cmp.company_website
	,cmp.street_address as company_street_address
	,locc.city_name as company_city
	,locc.state_province as company_state_province
	,locc.country as company_country
	,cmp.postal_code as company_postal_code
	,ind.industry_name
	,sub.subindustry_name
	,cmp.sic_code
	,cmp.naics_code
	,emp.employee_size_name
	,rev.revenue_range
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
;