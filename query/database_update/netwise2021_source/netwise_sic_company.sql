update ig_staging.company as t1
set sic_code = t2.company_primary_sic_code
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.sic_code is NULL
		or t1.sic_code = 0
	)
	and t2.company_primary_sic_code is not null
	and t2.company_primary_sic_code != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name))
	and t2.company_primary_sic_code in (select sic_code from ig_master.sic_code);