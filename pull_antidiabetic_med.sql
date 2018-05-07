/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [procedure_charge_cr_id]
      ,[source_system_mrd_id]
      ,[src_database_nm]
      ,[src_schema_nm]
      ,[src_object_nm]
      ,[src_column_nm]
      ,[src_column_value]
      ,[patient_ir_id]
      ,[src_patient_id]
      ,[src_encounter_id]
      ,[encounter_ir_id]
      ,[provider_ir_id]
      ,[src_provider_id]
      ,[src_provider_npi]
      ,[vocabulary_mrd_id]
      ,[vocabulary_code]
      ,[vocabulary]
      ,[start_dts]
      ,[stop_dts]
      ,[meta_load_exectn_guid]
      ,[meta_orignl_load_dts]
  FROM [EDW_IDS].[edw_ids_cr_dm].[procedure_charges]
  
  
  select distinct src_database_nm FROM [EDW_IDS].[edw_ids_cr_dm].[procedure_charges]
  
use EDW 
select scp.proc_start_dt_tm,scp.surg_proc_cd,cv.description
from nmh_cerner_ods.surg_case_procedure as scp
left outer join nmh_cerner_ods.code_value as cv
on cv.code_value = scp.surg_proc_cd
where proc_text is not null and proc_text != '' and proc_text != 'n/a' and proc_complete_qty  =1 and proc_text != 'na'
and proc_start_dt_tm between '2015-01-01'  and '2018-01-01'
  
  
  

  
 select top 10 * from edw_ids.[edw_ids_cr_dm].[prescriptions] 
 where medication_nm like '%metformin%'






drop table #t2d 
select patient_ir_id, diagnosis_cr_id, src_schema_nm, src_encounter_id, encounter_ir_id, diagnosis, diagnosis_dts, ROW_NUMBER() over (partition by patient_ir_id order by diagnosis_dts) as rk
into #t2d 
from edw_ids.edw_ids_cr_dm.diagnoses
where (
	vocabulary_value in ('250.20','250.30','250.40','250.50','250.60','250.70','250.80','250.90','250.22','250.32','250.42','250.52','250.62','250.72','250.82','250.92')
	and src_vocabulary = 'ICD9')
	or 
	(
	vocabulary_value in ('44054006','197763012','474213016','200951011','78158011','48EB2F20-59A4-4676-A1C0-40880362224F','359642000','81531005')
	and src_vocabulary = 'SNOMED' )  


select encounter_cr_id, src_schema_nm, src_encounter_id, patient_ir_id, start_dts, encounter_type_nm , ROW_NUMBER() over (partition by patient_ir_id order by (start_dts)) as rk 
into #enc 
from edw_ids.edw_ids_cr_dm.encounters

--select top 10 encounter_cr_id, src_schema_nm, src_encounter_id, patient_ir_id, start_dts, encounter_type_nm from edw_ids.edw_ids_cr_dm.encounters
select top 10 * from #enc order by patient_ir_id, rk 

select * 
into #idx 
from #t2d where rk =1 

select *
into #first_enc 
from #enc enc where enc.rk = 1 


select distinct enc.patient_ir_id, encounter_ir_id, enc.src_schema_nm, diagnosis_dts, src_encounter_id
into #cohort 
from #idx idx 
join #first_enc enc on idx.patient_ir_id = enc.patient_ir_id 
where DATEDIFF(month, start_dts,diagnosis_dts)> 12

select top 10 * from edw_ids.edw_ids_cr_dm.diagnoses

select t.enc.patient_ir_id, t.encounter_ir_id, enc.src_schema_nm, diagnosis_dts, src_encounter_id 
from #t2d t
join #cohort c on t.patient_ir_id = c.patient_ir_id 

--drop table #all_med
select p.patient_ir_id, p.src_encounter_id,p.src_prescription_order_id, medication, p.src_schema_nm, medication_nm, generic_medication_nm, diagnosis_dts, start_dts, stop_dts, vocabulary_value 
into #all_med
-- all after the first diagnosis of diabetes 
from  edw_ids.edw_ids_cr_dm.prescriptions p
join #cohort c on (c.patient_ir_id =  p.patient_ir_id)




select patient_ir_id, diagnosis_cr_id, src_schema_nm, src_encounter_id, encounter_ir_id, diagnosis, diagnosis_dts, ROW_NUMBER() over (partition by patient_ir_id order by diagnosis_dts) as rk
into #t2d2
from edw_ids.edw_ids_cr_dm.diagnoses
where (
	vocabulary_value in ('250.20','250.30','250.40','250.50','250.60','250.70','250.80','250.90','250.22','250.32','250.42','250.52','250.62','250.72','250.82','250.92')
	and src_vocabulary = 'ICD9')
	or 
	(
	vocabulary_value in ('44054006','197763012','474213016','200951011','78158011','48EB2F20-59A4-4676-A1C0-40880362224F','359642000','81531005')
	and src_vocabulary = 'SNOMED' )  


select p.patient_ir_id,  p.src_encounter_id,p.src_prescription_order_id, medication, medication_nm, generic_medication_nm, t2.diagnosis_dts, start_dts, stop_dts, vocabulary_value,
diagnosis 
into #t2d_med 
from #all_med p 
join #t2d2 t2 on (t2.patient_ir_id = p.patient_ir_id and p.src_encounter_id = t2.src_encounter_id and p.src_schema_nm = t2.src_schema_nm)

select * from #t2d_med
order by patient_ir_id

drop table #final
select p.*, v.medication_dsc
into #final 
from #t2d_med p
join edw_ids.edw_ids_cr_dm.medication_vocab_map v on p.medication =  v.medication
order by patient_ir_id 

--select top 10 * from edw_ids.edw_ids_cr_dm.medication_vocab_map


select * from #final 

select distinct  patient_ir_id, src_encounter_id, medication_dsc into #final1  from #final
select medication_dsc from #final1 

select distinct patient_ir_id from #t2d2
select top 10 * from edw_ids.edw_ids_cr_dm.prescriptions

select top 10 * from   edw_ids.edw_ids_cr_dm.prescriptions
select top 10 * from edw_ids.edw_ids_cr_dm.medication_vocab_map
select distinct medication into #v from edw_ids.edw_ids_cr_dm.medication_vocab_map

select COUNT(*) from #p
select * from #p left join #v on #p.medication = #v.medication

select top 10 * from edw_ids.edw_ids_cr_dm.diagnoses




select top 10 * from edw_ids.edw_ids_cr_dm.medication_vocab_map



-- only get patients having encounter at least 1 year before the medication exposure 
select * ,row_number() over (partition by patient_ir_id order by start_dts)
from edw_ids.[edw_ids_cr_dm].encounters
-- find the first T2D medication exposure by linking to T2D diagnoses 
select top 10 * from edw_ids.edw_ids_cr_dm.diagnoses dx 
join edw_ids.edw_ids_cr_dm.prescriptions med on (dx.src_schema_nm = med.src_schema_nm and dx.src_encounter_id = med.src_encounter_id and dx.patient_ir_id=med.patient_ir_id)





select top 10 * from edw_ids.edw_ids_cr_dm.encounters

join edw_ids.edw_ids_cr_dm.diagnoses on patient_ir_id = and src_schema_nm = and src_encounter_id = 


select  * from edw_ids.[edw_ids_cr_dm].diagnoses
where diagnosis like '%diabetes%2%' and src_vocabulary = 'snomed'
