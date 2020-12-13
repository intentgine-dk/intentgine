update ig_staging.company as t1
set postal_code = upper(trim(t2.zip))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.postal_code is null
		or t1.postal_code = ''
		or trim(t1.postal_code) = ''
		)
	and t2.zip is not null
	and t2.zip != ''
	and trim(t2.zip) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));