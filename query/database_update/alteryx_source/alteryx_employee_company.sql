update ig_staging.company as t1
set employee_size_id = case
						when t2.acc_emp_size_range = '1 - 50'
						then '02c84f8b-e340-4621-9a8e-47795be4dd9a'::uuid
						when t2.acc_emp_size_range = '51 - 200'
						then 'ecc3d206-0682-40f9-b827-5eb780efdc0b'::uuid
						when t2.acc_emp_size_range = '201 - 500'
						then '5f560a88-9a2a-4c53-a2eb-24d505bd22e5'::uuid
						when t2.acc_emp_size_range = '501 - 1,000'
						then '52d02cd6-f358-4103-992e-563e3d9cab49'::uuid
						when t2.acc_emp_size_range = '1,001 - 2,000'
						then '1ce179a0-b4ce-4aa0-aa15-3d9dacad04b4'::uuid
						when t2.acc_emp_size_range = '2,001 - 5,000'
						then '293998a6-ea29-4bed-ba38-cba6fb7b739c'::uuid
						when t2.acc_emp_size_range = '5,001 - 10,000'
						then '47955320-a21e-4ea9-9905-84f519477fd0'::uuid
						when t2.acc_emp_size_range = 'more than 10,000'
						then '432b4eeb-a106-48b0-8b29-ad07153db437'::uuid
						else t1.employee_size_id
					end	
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.acc_emp_size_range is not null
	and t2.acc_emp_size_range != ''
	and trim(t2.acc_emp_size_range) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));