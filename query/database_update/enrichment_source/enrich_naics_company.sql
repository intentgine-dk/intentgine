update ig_staging.company as t1
set naics_code =	CASE
						WHEN t2.naics_code1 is not NULL
							and t2.naics_code1 != 0
							and t2.naics_code1 in (select naics_code from ig_master.naics_code)
						THEN t2.naics_code1
						ELSE t1.naics_code
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.naics_code1 is not null
	and t2.naics_code1 != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name))
	and t2.naics_code1 in (select naics_code from ig_master.naics_code);