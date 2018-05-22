SELECT patient_ir_id, prescription_cr_id, medication, medication_nm, generic_medication_nm, start_dts, stop_dts, vocabulary_value
INTO #drug1 
FROM  edw_ids.edw_ids_cr_dm.prescriptions
where(
-- generic name, brand name, brand name... 
								   
								-- Alpha-glucosidas inhibitors
								generic_medication_nm LIKE 'acarbose' 
								OR generic_medication_nm LIKE  'Precose'
								OR generic_medication_nm LIKE  'Glucobay'
								OR generic_medication_nm LIKE 'miglitol'
								OR generic_medication_nm LIKE  'Glyset'
								OR generic_medication_nm LIKE 'Voglibose'
								OR generic_medication_nm LIKE  'Basen'
							  
								-- dipeptidyl peptidase IV inhibitors 
								OR generic_medication_nm LIKE 'alogliptin'
								OR generic_medication_nm LIKE  'Nesina'
								OR generic_medication_nm LIKE 
								'Anagliptin'
								OR generic_medication_nm LIKE   'Suiny'
								OR generic_medication_nm LIKE 'linagliptin'
								OR generic_medication_nm LIKE  'Tradjenta'
								OR generic_medication_nm LIKE  'saxagliptin'
								OR generic_medication_nm LIKE  'Onglyza'
								OR generic_medication_nm LIKE 'sitagliptin'
								OR generic_medication_nm LIKE  'Januvia'
								OR generic_medication_nm LIKE 'Teneligliptin'
								OR generic_medication_nm LIKE  'Tenelia'
								OR generic_medication_nm LIKE 'Vildagliptin'
								OR generic_medication_nm LIKE  'Galvus'
								OR generic_medication_nm LIKE  'Zomelis'
								 
								-- Glucagon-like Peptide-1 Agonists:
								OR generic_medication_nm LIKE 'Lixisenatide'
								OR generic_medication_nm LIKE 'Adlyxin'
								OR generic_medication_nm LIKE  'Lyxumia'
								OR generic_medication_nm LIKE 'Albiglutide'
								OR generic_medication_nm LIKE  'Tanzeum'
								OR generic_medication_nm LIKE  'Eperzan'
								OR generic_medication_nm LIKE 'Dulaglutide'
								OR generic_medication_nm LIKE  'Trulicity'
								OR generic_medication_nm LIKE 
								--'Sodium glucose cotransporter' SGLT) 2 inhibitors:
								'dapagliflozin'
								OR generic_medication_nm LIKE  'Forxiga'
								OR generic_medication_nm LIKE  'Farxiga'
								OR generic_medication_nm LIKE 'canagliflozin'
								OR generic_medication_nm LIKE  'Invokana'
								OR generic_medication_nm LIKE  'Sulisent'
								OR generic_medication_nm LIKE 'empagliflozin'
								OR generic_medication_nm LIKE 'Jardiance'OR generic_medication_nm LIKE 
								--'Sulfonylureas'OR generic_medication_nm LIKE  
								'Acetohexamide'OR generic_medication_nm LIKE  'Dymelor'OR generic_medication_nm LIKE  'Dimelor'OR generic_medication_nm LIKE 
								'glimepiride'OR generic_medication_nm LIKE 'Amaryl'OR generic_medication_nm LIKE 
								'gliclazide'OR generic_medication_nm LIKE '%Uni%Diamicron%'OR generic_medication_nm LIKE 
								'glipizide'OR generic_medication_nm LIKE  'Glucotrol'OR generic_medication_nm LIKE  'Minidiab'OR generic_medication_nm LIKE  'Minodiab'OR generic_medication_nm LIKE  'Glibenese'OR generic_medication_nm LIKE  'Glucotrol XL'OR generic_medication_nm LIKE  'Glipizide XL'OR generic_medication_nm LIKE 
								'glyburide'OR generic_medication_nm LIKE 
								'glibenclamide'OR generic_medication_nm LIKE  'DiaBeta'OR generic_medication_nm LIKE  'Glynase'OR generic_medication_nm LIKE  'Micronase'OR generic_medication_nm LIKE  'Glycron'OR generic_medication_nm LIKE 
								'chlorpropamide'OR generic_medication_nm LIKE 'Diabinese'
OR generic_medication_nm LIKE  '%Apo%Chlorpropamide%'OR generic_medication_nm LIKE  'Glucamide'OR generic_medication_nm LIKE  'Novo-Propamide'OR generic_medication_nm LIKE  'Insulase'OR generic_medication_nm LIKE 
								'tolazamide'OR generic_medication_nm LIKE  'Tolinase'OR generic_medication_nm LIKE  'Glynase PresTabOR' or generic_medication_nm LIKE  'Tolamide'
								OR generic_medication_nm LIKE 'tolbutamide'
								OR generic_medication_nm LIKE  'Orinase'
								OR generic_medication_nm LIKE  'Tol-Tab'
								OR generic_medication_nm LIKE  '%Apo%Tolbutamide%'
								OR generic_medication_nm LIKE  '%Novo%Butamide%'
								OR generic_medication_nm LIKE 'Glyclopyramide' 
								OR  generic_medication_nm LIKE '%Deamelin%S%'
								OR  generic_medication_nm LIKE 'Gliquidone'
								OR  generic_medication_nm LIKE  'Glurenorm'
 --Amylinomimetics
								OR  generic_medication_nm LIKE 'Pramlintide'
								OR  generic_medication_nm LIKE  'Symlin'
								OR  generic_medication_nm LIKE  'SymlinPen'
								OR  generic_medication_nm LIKE  'SymlinPen'
 
								--Meglitinides' --:
								OR  generic_medication_nm LIKE 	'nateglinide'
								OR  generic_medication_nm LIKE 'Starlix'
								OR  generic_medication_nm LIKE 'repaglinide'
								OR  generic_medication_nm LIKE  'Prandin'
								OR  generic_medication_nm LIKE  'Novonorm'
 								--'Insulin' --:
								OR  generic_medication_nm LIKE '%Insulin%aspart%'
								OR  generic_medication_nm LIKE  'NovoLog'
								OR  generic_medication_nm LIKE '%Insulin%glulisine%'
								OR  generic_medication_nm LIKE  'Apidra'
								OR  generic_medication_nm LIKE  '%nsulin%lispro%'
								OR  generic_medication_nm LIKE  'Humalog'
								OR  generic_medication_nm LIKE  '%Insulin%inhaled%' 
								OR  generic_medication_nm LIKE  'Afrezza'
								OR  generic_medication_nm LIKE '%Regular%insulin%'
								OR  generic_medication_nm LIKE  '%Humulin%R%'
								OR  generic_medication_nm LIKE  '%Novolin%R%'

								-- 'Intermediate-Acting' -- Insulins:
								OR  generic_medication_nm LIKE	'Insulin%NPH%'
								OR  generic_medication_nm LIKE  '%Humulin%N%'
								OR  generic_medication_nm LIKE  '%Novolin%N%'
								OR  generic_medication_nm LIKE 'Insulin%detemir%'
								OR  generic_medication_nm LIKE  'Levemir'
								OR  generic_medication_nm LIKE 	'Insulin%glargine%'
								OR  generic_medication_nm LIKE  'Lantus'
								OR  generic_medication_nm LIKE  'Lantus SoloStar'
								OR  generic_medication_nm LIKE  'Toujeo'
								OR  generic_medication_nm LIKE  'Basaglar'
								OR  generic_medication_nm LIKE 'Insulin%degludec%'
								OR  generic_medication_nm LIKE  'Tresiba'
								OR  generic_medication_nm LIKE	'%Insulin%aspart%protamine%insulin%aspart%'
								OR  generic_medication_nm LIKE  'NovoLog'
								OR  generic_medication_nm LIKE  'NovoLog'
								OR  generic_medication_nm LIKE  '%Insulin%lispro%protamine%insulin%lispro%'
								OR  generic_medication_nm LIKE  'Humalog'
								OR  generic_medication_nm LIKE  'Humalog'
								OR  generic_medication_nm LIKE  'Actrapid'
								OR  generic_medication_nm LIKE 'Hypurin'
								OR  generic_medication_nm LIKE  'Iletin'
								OR  generic_medication_nm LIKE 'Insulatard'
								OR  generic_medication_nm LIKE 'Insuman'
								OR  generic_medication_nm LIKE 'Mixtard'
								OR  generic_medication_nm LIKE 'NovoMix'
								OR  generic_medication_nm LIKE 'NovoRapid'
								OR  generic_medication_nm LIKE 'Oralin'
								OR  generic_medication_nm LIKE 'Abasaglar'
								OR  generic_medication_nm LIKE 'Ryzodeg'
								OR  generic_medication_nm LIKE 'V-go'	

								-- combinations 
								OR  generic_medication_nm LIKE '%linagliptin%empagliflozin%'
								OR  generic_medication_nm LIKE  'Glyxambi'
								OR  generic_medication_nm LIKE  '%sitagliptin%simvastatin%'
								OR  generic_medication_nm LIKE  'Juvisync'
								OR  generic_medication_nm LIKE  'Epistatin'
								OR  generic_medication_nm LIKE  'Synvinolin'
								OR  generic_medication_nm LIKE  'ZocOR'
								OR  generic_medication_nm LIKE  '%metformin%sitagliptin%'
								OR  generic_medication_nm LIKE  'Janumet'
								OR  generic_medication_nm LIKE  '%Janumet%XR%'
								OR  generic_medication_nm LIKE '%metfORmin%alogliptin%'
								OR  generic_medication_nm LIKE  'Kazano'
								OR  generic_medication_nm LIKE	 '%metfORmin%linagliptin%'
								OR  generic_medication_nm LIKE  'Jentadueto'
								OR  generic_medication_nm LIKE  '%Jentadueto%XR%'
								OR  generic_medication_nm LIKE '%alogliptin%pioglitazone%'
								OR  generic_medication_nm LIKE  'Oseni'
								OR  generic_medication_nm LIKE '%metfORmin%vildagliptin%'
								OR  generic_medication_nm LIKE  'Eucreas'
								OR  generic_medication_nm LIKE '%metfORmin%saxagliptin%'
								OR  generic_medication_nm LIKE  'Kombiglyze XR'
								OR  generic_medication_nm LIKE '%metfORmin%canagliflozin%'
								OR  generic_medication_nm LIKE  'Invokamet'
								OR  generic_medication_nm LIKE '%metfORmin%dapagliflozin%'
								OR  generic_medication_nm LIKE  'Xigduo XR'
								OR  generic_medication_nm LIKE '%metfORmin%empagliflozin%'
								OR  generic_medication_nm LIKE  'Synjardy'
								OR  generic_medication_nm LIKE '%metfORmin%glipizide%'
								OR  generic_medication_nm LIKE  'Metaglip'
								OR  generic_medication_nm LIKE	'%metfORmin%glyburide%'
								OR  generic_medication_nm LIKE  'Glucovance'
								OR  generic_medication_nm LIKE '%metfoRmin%repaglinide%'
								OR  generic_medication_nm LIKE  'PrandiMet' 
-- Medications non-specific to T2DM 
--Biguanides:	
								OR  generic_medication_nm LIKE  'MetfORmin'
								OR  generic_medication_nm LIKE  'Glucophage'
								OR  generic_medication_nm LIKE  'FORtamet'
								OR  generic_medication_nm LIKE  'Glumetza'
								OR  generic_medication_nm LIKE  'Riomet'
 
								--'Glucagon-like Peptide-1 Agonists': 
								OR  generic_medication_nm LIKE	'Exenatide'
								OR  generic_medication_nm LIKE  'Byetta'
								OR  generic_medication_nm LIKE  'Bydureon'
								OR  generic_medication_nm LIKE 'Liraglutide'
								OR  generic_medication_nm LIKE  'Victoza'
								OR  generic_medication_nm LIKE  'Saxenda'
 --Thiazolidinediones:
								OR  generic_medication_nm LIKE  'rosiglitazone'
								OR  generic_medication_nm LIKE  'Avandia'
								OR  generic_medication_nm LIKE  'pioglitazone'
								OR  generic_medication_nm LIKE  'Actos'
								OR  generic_medication_nm LIKE  'Troglitazone'
								OR  generic_medication_nm LIKE  'Noscal'
								OR  generic_medication_nm LIKE  'Resulin'
								OR  generic_medication_nm LIKE  'Rezulin'
								OR  generic_medication_nm LIKE  'Romozin'
								OR  generic_medication_nm LIKE 
--Combinations:
								'%metfORmin%pioglitazone%'
								OR  generic_medication_nm LIKE  'Actoplus'
								OR  generic_medication_nm LIKE  '%Actoplus%Met%'
								OR  generic_medication_nm LIKE  '%Actoplus%Met%XR%'
								OR  generic_medication_nm LIKE  'Competact'
								OR  generic_medication_nm LIKE  '%metfORmin%rosiglitazone%'
								OR  generic_medication_nm LIKE  'Avandamet'
								OR  generic_medication_nm LIKE  '%rosiglitizone%metfORmin%'
								OR  generic_medication_nm LIKE  '%Amaryl%M%'
								OR  generic_medication_nm LIKE  '%glimepiride%pioglitazone%'
								OR  generic_medication_nm LIKE  'Duetact'
								OR  generic_medication_nm LIKE  '%glimeperide%rosiglitazone%'
								OR  generic_medication_nm LIKE  'Avandaryl'
								OR  generic_medication_nm LIKE '%glibornuride%' 
								OR  generic_medication_nm LIKE '%glymidine%' 
								OR  generic_medication_nm LIKE '%phenformin%' 
								OR  generic_medication_nm LIKE '%benfluorex%' 
								OR  generic_medication_nm LIKE '%tolrestat%'
			)


			
			
			

SELECT patient_ir_id, prescription_cr_id, medication, medication_nm, generic_medication_nm, start_dts, stop_dts, vocabulary_value
into #drug2 
FROM  edw_ids.edw_ids_cr_dm.prescriptions

where(
-- generic name, brand name, brand name... 
								   
								-- Alpha-glucosidas inhibitors
								medication_nm LIKE 'acarbose' 
								OR medication_nm LIKE  'Precose'
								OR medication_nm LIKE  'Glucobay'
								OR medication_nm LIKE 'miglitol'
								OR medication_nm LIKE  'Glyset'
								OR medication_nm LIKE 'Voglibose'
								OR medication_nm LIKE  'Basen'						  
								-- dipeptidyl peptidase IV inhibitors 
								OR medication_nm LIKE 'alogliptin'
								OR medication_nm LIKE  'Nesina'
								OR medication_nm LIKE 'Anagliptin'
								OR medication_nm LIKE   'Suiny'
								OR medication_nm LIKE 'linagliptin'
								OR medication_nm LIKE  'Tradjenta'
								OR medication_nm LIKE  'saxagliptin'
								OR medication_nm LIKE  'Onglyza'
								OR medication_nm LIKE 'sitagliptin'
								OR medication_nm LIKE  'Januvia'
								OR medication_nm LIKE 'Teneligliptin'
								OR medication_nm LIKE  'Tenelia'
								OR medication_nm LIKE 'Vildagliptin'
								OR medication_nm LIKE  'Galvus'
								OR medication_nm LIKE  'Zomelis'
								 
								-- Glucagon-like Peptide-1 Agonists:
								OR medication_nm LIKE 'Lixisenatide'
								OR medication_nm LIKE 'Adlyxin'
								OR medication_nm LIKE  'Lyxumia'
								OR medication_nm LIKE 'Albiglutide'
								OR medication_nm LIKE  'Tanzeum'
								OR medication_nm LIKE  'Eperzan'
								OR medication_nm LIKE 'Dulaglutide'
								OR medication_nm LIKE  'Trulicity'
								OR medication_nm LIKE 
								--'Sodium glucose cotransporter' SGLT) 2 inhibitors:
								'dapagliflozin'OR medication_nm LIKE  'Forxiga'OR medication_nm LIKE  'Farxiga'OR medication_nm LIKE 
								'canagliflozin'OR medication_nm LIKE  'Invokana'OR medication_nm LIKE  'Sulisent'OR medication_nm LIKE 
								'empagliflozin'OR medication_nm LIKE 'Jardiance'OR medication_nm LIKE 
								--'Sulfonylureas'OR medication_nm LIKE  
								'Acetohexamide'OR medication_nm LIKE  'Dymelor'OR medication_nm LIKE  'Dimelor'OR medication_nm LIKE 
								'glimepiride'OR medication_nm LIKE 'Amaryl'OR medication_nm LIKE 
								'gliclazide'OR medication_nm LIKE '%Uni%Diamicron%'OR medication_nm LIKE 
								'glipizide'OR medication_nm LIKE  'Glucotrol'OR medication_nm LIKE  'Minidiab'OR medication_nm LIKE  'Minodiab'OR medication_nm LIKE  'Glibenese'OR medication_nm LIKE  'Glucotrol XL'OR medication_nm LIKE  'Glipizide XL'OR medication_nm LIKE 
								'glyburide'OR medication_nm LIKE 
								'glibenclamide'OR medication_nm LIKE  'DiaBeta'OR medication_nm LIKE  'Glynase'OR medication_nm LIKE  'Micronase'OR medication_nm LIKE  'Glycron'OR medication_nm LIKE 
								'chlorpropamide'OR medication_nm LIKE 'Diabinese'OR medication_nm LIKE  '%Apo%Chlorpropamide%'OR medication_nm LIKE  'Glucamide'OR medication_nm LIKE  'Novo-Propamide'OR medication_nm LIKE  'Insulase'OR medication_nm LIKE 
								'tolazamide'OR medication_nm LIKE  'Tolinase'OR medication_nm LIKE  'Glynase PresTabOR'								OR medication_nm LIKE  'Tolamide'
								OR medication_nm LIKE 'tolbutamide'
								OR medication_nm LIKE  'Orinase'
								OR medication_nm LIKE  'Tol-Tab'
								OR medication_nm LIKE  '%Apo%Tolbutamide%'
								OR medication_nm LIKE  '%Novo%Butamide%'
								OR medication_nm LIKE 'Glyclopyramide' 
								OR  medication_nm LIKE '%Deamelin%S%'
								OR  medication_nm LIKE 'Gliquidone'
								OR  medication_nm LIKE  'Glurenorm'
 --Amylinomimetics
								OR  medication_nm LIKE 'Pramlintide'
								OR  medication_nm LIKE  'Symlin'
								OR  medication_nm LIKE  'SymlinPen'
								OR  medication_nm LIKE  'SymlinPen'
 
								--Meglitinides' --:
								OR  medication_nm LIKE 	'nateglinide'
								OR  medication_nm LIKE 'Starlix'
								OR  medication_nm LIKE 'repaglinide'
								OR  medication_nm LIKE  'Prandin'
								OR  medication_nm LIKE  'Novonorm'
 								--'Insulin' --:
								OR  medication_nm LIKE '%Insulin%aspart%'
								OR  medication_nm LIKE  'NovoLog'
								OR  medication_nm LIKE '%Insulin%glulisine%'
								OR  medication_nm LIKE  'Apidra'
								OR  medication_nm LIKE  '%nsulin%lispro%'
								OR  medication_nm LIKE  'Humalog'
								OR  medication_nm LIKE  '%Insulin%inhaled%' 
								OR  medication_nm LIKE  'Afrezza'
								OR  medication_nm LIKE '%Regular%insulin%'
								OR  medication_nm LIKE  '%Humulin%R%'
								OR  medication_nm LIKE  '%Novolin%R%'

								-- 'Intermediate-Acting' -- Insulins:
								OR  medication_nm LIKE			'Insulin%NPH%'
								OR  medication_nm LIKE  '%Humulin%N%'
								OR  medication_nm LIKE  '%Novolin%N%'
								OR  medication_nm LIKE 'Insulin%detemir%'
								OR  medication_nm LIKE  'Levemir'
								OR  medication_nm LIKE 	'Insulin%glargine%'
								OR  medication_nm LIKE  'Lantus'
								OR  medication_nm LIKE  'Lantus SoloStar'
								OR  medication_nm LIKE  'Toujeo'
								OR  medication_nm LIKE  'Basaglar'
								OR  medication_nm LIKE 'Insulin%degludec%'
								OR  medication_nm LIKE  'Tresiba'
								OR  medication_nm LIKE	'%Insulin%aspart%protamine%insulin%aspart%'
								OR  medication_nm LIKE  'NovoLog'
								OR  medication_nm LIKE  'NovoLog'
								OR  medication_nm LIKE  '%Insulin%lispro%protamine%insulin%lispro%'
								OR  medication_nm LIKE  'Humalog'
								OR  medication_nm LIKE  'Humalog'
								OR  medication_nm LIKE  'Actrapid'
								OR  medication_nm LIKE 'Hypurin'
								OR  medication_nm LIKE  'Iletin'
								OR  medication_nm LIKE 'Insulatard'
								OR  medication_nm LIKE 'Insuman'
								OR  medication_nm LIKE 'Mixtard'
								OR  medication_nm LIKE 'NovoMix'
								OR  medication_nm LIKE 'NovoRapid'
								OR  medication_nm LIKE 'Oralin'
								OR  medication_nm LIKE 'Abasaglar'
								OR  medication_nm LIKE 'Ryzodeg'
								OR  medication_nm LIKE 'V-go'	

								-- combinations 
								OR  medication_nm LIKE '%linagliptin%empagliflozin%'
								OR  medication_nm LIKE  'Glyxambi'
								OR  medication_nm LIKE  '%sitagliptin%simvastatin%'
								OR  medication_nm LIKE  'Juvisync'
								OR  medication_nm LIKE  'Epistatin'
								OR  medication_nm LIKE  'Synvinolin'
								OR  medication_nm LIKE  'ZocOR'
								OR  medication_nm LIKE  '%metformin%sitagliptin%'
								OR  medication_nm LIKE  'Janumet'
								OR  medication_nm LIKE  '%Janumet%XR%'
								OR  medication_nm LIKE '%metfORmin%alogliptin%'
								OR  medication_nm LIKE  'Kazano'
								OR  medication_nm LIKE	 '%metfORmin%linagliptin%'
								OR  medication_nm LIKE  'Jentadueto'
								OR  medication_nm LIKE  '%Jentadueto%XR%'
								OR  medication_nm LIKE '%alogliptin%pioglitazone%'
								OR  medication_nm LIKE  'Oseni'
								OR  medication_nm LIKE '%metfORmin%vildagliptin%'
								OR  medication_nm LIKE  'Eucreas'
								OR  medication_nm LIKE '%metfORmin%saxagliptin%'
								OR  medication_nm LIKE  'Kombiglyze XR'
								OR  medication_nm LIKE '%metfORmin%canagliflozin%'
								OR  medication_nm LIKE  'Invokamet'
								OR  medication_nm LIKE '%metfORmin%dapagliflozin%'
								OR  medication_nm LIKE  'Xigduo XR'
								OR  medication_nm LIKE '%metfORmin%empagliflozin%'
								OR  medication_nm LIKE  'Synjardy'
								OR  medication_nm LIKE '%metfORmin%glipizide%'
								OR  medication_nm LIKE  'Metaglip'
								OR  medication_nm LIKE	'%metfORmin%glyburide%'
								OR  medication_nm LIKE  'Glucovance'
								OR  medication_nm LIKE '%metfoRmin%repaglinide%'
								OR  medication_nm LIKE  'PrandiMet'

-- Medications non-specific to T2DM 
--Biguanides:	
								OR  medication_nm LIKE  'MetfORmin'
								OR  medication_nm LIKE  'Glucophage'
								OR  medication_nm LIKE  'FORtamet'
								OR  medication_nm LIKE  'Glumetza'
								OR  medication_nm LIKE  'Riomet'
 
								--'Glucagon-like Peptide-1 Agonists': 
								OR  medication_nm LIKE	'Exenatide'
								OR  medication_nm LIKE  'Byetta'
								OR  medication_nm LIKE  'Bydureon'
								OR  medication_nm LIKE 'Liraglutide'
								OR  medication_nm LIKE  'Victoza'
								OR  medication_nm LIKE  'Saxenda'
 --Thiazolidinediones:
								OR  medication_nm LIKE  'rosiglitazone'
								OR  medication_nm LIKE  'Avandia'
								OR  medication_nm LIKE  'pioglitazone'
								OR  medication_nm LIKE  'Actos'
								OR  medication_nm LIKE  'Troglitazone'
								OR  medication_nm LIKE  'Noscal'
								OR  medication_nm LIKE  'Resulin'
								OR  medication_nm LIKE  'Rezulin'
								OR  medication_nm LIKE  'Romozin'
								
--Combinations:
								OR  medication_nm LIKE '%metfORmin%pioglitazone%'
								OR  medication_nm LIKE  'Actoplus'
								OR  medication_nm LIKE  '%Actoplus%Met%'
								OR  medication_nm LIKE  '%Actoplus%Met%XR%'
								OR  medication_nm LIKE  'Competact'
								OR  medication_nm LIKE  '%metfORmin%rosiglitazone%'
								OR  medication_nm LIKE  'Avandamet'
								OR  medication_nm LIKE  '%rosiglitizone%metfORmin%'
								OR  medication_nm LIKE  '%Amaryl%M%'
								OR  medication_nm LIKE  '%glimepiride%pioglitazone%'
								OR  medication_nm LIKE  'Duetact'
								OR  medication_nm LIKE  '%glimeperide%rosiglitazone%'
								OR  medication_nm LIKE  'Avandaryl'
			
			)			
			
