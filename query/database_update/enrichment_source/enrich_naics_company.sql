update ig_staging.company as t1
set naics_code = t2.naics_code1
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.naics_code is null
	and t2.naics_code1 is not null
	and t2.naics_code1 != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name))
	and t2.naics_code1 in (select naics_code from ig_master.naics_code);