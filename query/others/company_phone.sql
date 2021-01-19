--Good: 'AA', 'B', 'NEW', 'PM', 'PU', 'NI', 'NA', 'AB'
--Bad: 'DC', 'PDROP', 'BAD', 'Invalid', 'ADC', 'N', 'XFER';

update ig_dev.verify_company_phone as t1
set 
	company_phone_number = t2.company_phone_number
	,status = t2.status
	,insert_date = NOW()::date
from public.company_dialer as t2
where
	lower(trim(t1.email_domain)) = lower(trim(t2.email_domain))
	and t1.status in ('DC', 'PDROP', 'BAD', 'Invalid', 'ADC', 'N', 'XFER', 'NA')
	and t2.status not in ('DC', 'PDROP', 'BAD', 'Invalid', 'ADC', 'N', 'XFER');
	
update ig_dev.verify_company_phone as t1
set 
	company_phone_number = t2.company_phone_number
	,status = t2.status
	,insert_date = NOW()::date
from public.company_dialer as t2
where
	lower(trim(t1.email_domain)) = lower(trim(t2.email_domain))
	and t1.status is null;

update ig_production.company as t1
set phone_number = t2.company_phone_number 
from ig_dev.verify_company_phone as t2
where
	lower(trim(t1.company_website)) = lower(trim(t2.email_domain))
	and t2.status not in ('DC', 'PDROP', 'BAD', 'Invalid', 'ADC', 'N', 'XFER')
	AND t2.fix = 'Yes';

--180.190.136.112
