update ig_staging.company as t1
set postal_code =	CASE
						WHEN upper(trim(t2.company_zip_local)) != '' and t2.company_zip_local is not null
						THEN upper(trim(t2.company_zip_local))
						ELSE t1.postal_code
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.postal_code IS NULL
		OR TRIM(t1.postal_code) = ''
	)
	and t2.company_zip_local is not null
	and t2.company_zip_local != ''
	and trim(t2.company_zip_local) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')));