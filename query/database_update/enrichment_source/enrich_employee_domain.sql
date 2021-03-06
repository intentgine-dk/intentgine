update ig_staging.company as t1
set employee_size_id = CASE
						when company_employees::numeric between 1 and 50
						then '02c84f8b-e340-4621-9a8e-47795be4dd9a'::uuid
						when company_employees::numeric between 51 and 200
						then 'ecc3d206-0682-40f9-b827-5eb780efdc0b'::uuid
						when company_employees::numeric between 201 and 500
						then '5f560a88-9a2a-4c53-a2eb-24d505bd22e5'::uuid
						when company_employees::numeric between 501 and 1000
						then '52d02cd6-f358-4103-992e-563e3d9cab49'::uuid
						when company_employees::numeric between 1001 and 2000
						then '1ce179a0-b4ce-4aa0-aa15-3d9dacad04b4'::uuid
						when company_employees::numeric between 2001 and 5000
						then '293998a6-ea29-4bed-ba38-cba6fb7b739c'::uuid
						when company_employees::numeric between 5001 and 10000
						then '47955320-a21e-4ea9-9905-84f519477fd0'::uuid
						when company_employees::numeric > 10000
						then '432b4eeb-a106-48b0-8b29-ad07153db437'::uuid
						else t1.employee_size_id
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_employees is not null
	and t2.company_employees != '0'
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')));