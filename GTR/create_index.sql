call log('create_index.sql','GTR Genetic Test Registry');

update test_condition_gene set Symbol = NULL where Symbol = 'N/A'; 

call create_index('test_condition_gene', 'test_accession_ver'); 
call create_index('test_condition_gene', 'concept_type'); 
call create_index('test_condition_gene', 'gene_or_SNOMED_CT_ID'); 
call create_index('test_condition_gene', 'MIM_number'); 
call create_index('test_condition_gene', 'concept_type'); 
call create_index('test_condition_gene', 'test_type'); 
call create_index('test_condition_gene', 'GTR_identifier'); 
call create_index('test_condition_gene', 'MIM_number'); 

call create_index('test_version','test_accession_ver'); 
call create_index('test_version','now_current'); 

call log('create_index.sql','done'); 
