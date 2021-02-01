update ig_staging.company as t1
set street_address =	CASE
							WHEN upper(trim(t2.company_address1_local)) != '' and t2.company_address1_local is not NULL
							then upper(trim(t2.company_address1_local))
							ELSE t1.street_address
						END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.street_address IS NULL
		OR TRIM(t1.street_address) = ''
	)
	and t2.company_address1_local is not null
	and t2.company_address1_local != ''
	and trim(t2.company_address1_local) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));