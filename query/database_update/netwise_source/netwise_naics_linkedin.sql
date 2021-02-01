update ig_staging.company as t1
set naics_code =	CASE
						WHEN t2.company_primary_naics_code is not null 
							and substring(NULLIF(regexp_replace(t2.company_primary_naics_code, '\D','','g'), ''), 1, 6)::numeric != 0
							and substring(NULLIF(regexp_replace(t2.company_primary_naics_code, '\D','','g'), ''), 1, 6)::numeric in (select naics_code from ig_master.naics_code)
						THEN substring(NULLIF(regexp_replace(t2.company_primary_naics_code, '\D','','g'), ''), 1, 6)::numeric
						ELSE t1.naics_code
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_primary_naics_code is not null
	and substring(NULLIF(regexp_replace(t2.company_primary_naics_code, '\D','','g'), ''), 1, 6)::numeric != 0
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url))
	and substring(NULLIF(regexp_replace(t2.company_primary_naics_code, '\D','','g'), ''), 1, 6)::numeric in (select naics_code from ig_master.naics_code);