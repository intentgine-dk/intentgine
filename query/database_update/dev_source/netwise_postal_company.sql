update ig_staging.company as t1
set postal_code = t2.company_zip_headquarters
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.postal_code IS NULL
		OR TRIM(t1.postal_code) = ''
	)
	and t2.company_zip_headquarters is not null
	and t2.company_zip_headquarters != ''
	and trim(t2.company_zip_headquarters) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));

