call log('create_index.sql', 'begin');

call create_index('var_citations', 'AlleleID');
call create_index('var_citations', 'VariationID');
call create_index('var_citations', 'rs_id');
call create_index('var_citations', 'nsv_id');
-- call create_index('var_citations', 'citation_source');
call create_index('var_citations', 'citation_id');

call create_index('variant_summary', 'AlleleID');
call create_index('variant_summary', 'variant_name');
-- call create_index('variant_summary', 'TestedInGTR');
call create_index('variant_summary', 'VariationID');

-- call create_index('variant_summary', 'PhenotypeIDs');
call create_index('variant_summary', 'ClinicalSignificance');

call create_index('variant_summary', 'rs_id');
call create_index('variant_summary', 'Start');
call create_index('variant_summary', 'Stop');

call create_index('gene_condition_source_id', 'GeneID');
call create_index('gene_condition_source_id', 'Symbol');
call create_index('gene_condition_source_id', 'ConceptID');
call create_index('gene_condition_source_id', 'DiseaseName');
call create_index('gene_condition_source_id', 'SourceName');
call create_index('gene_condition_source_id', 'SourceID');
call create_index('gene_condition_source_id', 'DiseaseMIM');

call create_index('disease_names','DiseaseName');
call create_index('disease_names','SourceName');
call create_index('disease_names','SourceID');
call create_index('disease_names','DiseaseMIM');

call create_index('molecular_consequences', 'HGVS'); 
call create_index('molecular_consequences', 'SequenceOntologyID'); 
call create_index('molecular_consequences', 'Value');

call create_index('gene_specific_summary','GeneID');
call create_index('gene_specific_summary','Symbol');

call create_index('clingen_gene_curation_list','GeneID'); 

call create_index('clinvar_hgvs', 'VariationID');
call create_index('clinvar_hgvs', 'AlleleID');
call create_index('clinvar_hgvs', 'RCVAccession');
call create_index('clinvar_hgvs', 'HGVS');

call create_index('variation_allele', 'AlleleID');

-- APPLYING HOTFIX FOR MISSING VariationID in variant_summary as of 10/2016
call log('variant_summary hotfix', 'start');
update variant_summary VS, variation_allele VA
    set VS.VariationID = VA.VariationID 
    where VS.AlleleID = VA.AlleleID;
call log('variant_summary hotfix', 'done');

call create_index('variation_allele', 'VariationID');

call log('create_index.sql', 'done'); 

