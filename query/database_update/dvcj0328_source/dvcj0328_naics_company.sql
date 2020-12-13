update ig_staging.company as t1
set naics_code = substring(NULLIF(regexp_replace(t2.naics, '\D','','g'), ''), 1, 6)::numeric
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.naics_code is null
	and t2.naics is not null
	and substring(NULLIF(regexp_replace(t2.naics, '\D','','g'), ''), 1, 6)::numeric != 0
	and upper(trim(t1.company_name)) = upper(trim(t2.business_name))
	and substring(NULLIF(regexp_replace(t2.naics, '\D','','g'), ''), 1, 6)::numeric in (select naics_code from ig_master.naics_code);