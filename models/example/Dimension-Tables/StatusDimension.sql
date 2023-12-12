
Select * , 
row_number() over() as status_ID from

(

select  
Distinct
status

from {{ ref("311_Compliant_staging")}}
 )






