update ig_staging.company as t1
set sic_code = substring(NULLIF(regexp_replace(t2.sic_code, '\D','','g'), ''), 1, 6)::numeric
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.sic_code is null
	and t2.sic_code is not null
	and substring(NULLIF(regexp_replace(t2.sic_code, '\D','','g'), ''), 1, 6)::numeric != 0
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(replace(t1.company_linkedin_url, 'https://www.', ''))) = lower(trim(t2.company_linkedin_url))
	and substring(NULLIF(regexp_replace(t2.sic_code, '\D','','g'), ''), 1, 6)::numeric in (select sic_code from ig_master.sic_code);