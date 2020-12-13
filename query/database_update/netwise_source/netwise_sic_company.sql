update ig_staging.company as t1
set sic_code = substring(t2.company_primary_sic_code, 1, 4)::numeric
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.sic_code is null
	and t2.company_primary_sic_code is not null
	and substring(t2.company_primary_sic_code, 1, 4)::numeric != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name))
	and t2.company_primary_sic_code::numeric in (select sic_code from ig_master.sic_code);