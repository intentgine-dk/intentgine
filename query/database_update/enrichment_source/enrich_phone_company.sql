update ig_staging.company as t1
set phone_number =	CASE
						WHEN upper(trim(t2.company_phone1)) != '' and t2.company_phone1 is not null
						then upper(trim(t2.company_phone1))
						ELSE t1.phone_number
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_phone1 is not null
	and t2.company_phone1 != ''
	and trim(t2.company_phone1) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));