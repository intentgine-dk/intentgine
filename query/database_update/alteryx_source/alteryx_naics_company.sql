update ig_staging.company as t1
set naics_code = substring(trim(t2.acc_naics_code), 1, 6)::numeric
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.naics_code is null
	and t2.acc_naics_code is not null
	and substring(trim(t2.acc_naics_code), 1, 6)::numeric != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name))
	and substring(trim(t2.acc_naics_code), 1, 6)::numeric in (select naics_code from ig_master.naics_code);