update ig_staging.company as t1
set sic_code = t2.sic_code1
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.sic_code is null
	and t2.sic_code1 is not null
	and t2.sic_code1 != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name))
	and t2.sic_code1 in (select sic_code in ig_master.sic_code);