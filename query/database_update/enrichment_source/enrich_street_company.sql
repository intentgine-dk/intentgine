update ig_staging.company as t1
set street_address =	CASE
							WHEN upper(trim(t2.company_address)) != '' and t2.company_address is not null
							then upper(trim(t2.company_address))
							ELSE t1.street_address
						END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_address is not null
	and t2.company_address != ''
	and trim(t2.company_address) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));