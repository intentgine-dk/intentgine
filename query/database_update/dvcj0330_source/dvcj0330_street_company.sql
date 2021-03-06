update ig_staging.company as t1
set street_address = upper(trim(t2.address))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.street_address is null
		or t1.street_address = ''
		or trim(t1.street_address) = ''
		)
	and t2.address is not null
	and t2.address != ''
	and trim(t2.address) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));