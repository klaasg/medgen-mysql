call log('ClinVar Clinical Variants', 'ncbi'); 

-- begin
call log('gene_condition_source_id','refresh');

drop table if exists gene_condition_source_id; 

create table gene_condition_source_id(
       GeneID		 int,
       Symbol          varchar(10),
       ConceptID       varchar(20),
       DiseaseName     varchar(1000),
       SourceName      varchar(150),
       SourceID        varchar(50),
       DiseaseMIM      varchar(20),
       LastModified    varchar(20)
);
call utf8_unicode('gene_condition_source_id'); 

-- end
-- ###################################
-- begin
call log('disease_names','refresh');

drop table if exists disease_names; 

create table disease_names(
     DiseaseName     varchar(1000),
     SourceName      varchar(150),
     ConceptID       varchar(20),
     SourceID        varchar(50),
     DiseaseMIM      varchar(20),
     LastModified    varchar(20)
);

call utf8_unicode('disease_names'); 

-- end
-- ###################################
-- begin
call log('gene_specific_summary','refresh');

drop table if exists gene_specific_summary; 

create table gene_specific_summary (
  Symbol   varchar(20)  not null,  
  GeneID       integer  not null,   
  Submissions  integer  not null, 	
  Alleles      integer  not null 
);

call utf8_unicode('gene_specific_summary'); 

-- end
-- ###################################
-- begin

call log('variant_summary','refresh');

drop table if exists variant_summary; 

create table variant_summary (
       AlleleID         integer not null, 
       variant_type     varchar(50) not null, 
       variant_name     text, 
       GeneID           integer  not null,   
       Symbol           varchar(20)  not null,  
       ClinicalSignificance text, 
       rs                   integer, 
       dbvar_nsv         text, 
       RCVaccession	 text, 
       TestedInGTR       char, 
       PhenotypeIDs      text, 
       Origin            text, 
       Assembly      	 text, 
       Chromosome        varchar(20),
       Start             integer, 
       Stop              integer, 
       Cytogenetic       text, 
       ReviewStatus      text, 
       HGVS_c            varchar(200), 
       HGVS_p            varchar(200), 
       NumberSubmitters  integer, 
       LastEvaluated     text, 
       Guidelines        text, 
       OtherIDs          text 
);
call utf8_unicode('variant_summary'); 

call log('create_tables','done');

-- end 
-- ###################################
-- begin 

call log('ClinGen gene_curation_list','refresh'); 

drop table if exists clingen_gene_curation_list; 

create table clingen_gene_curation_list  
(
	Symbol             varchar(50), 
       	GeneID             int(10)  unsigned, 
	cytoBand           text, 
       	g_location         text,
       	haplo_score        text,         
       	haplo_desc         text, 
       	haplo_insuf_pmid1  text,
       	haplo_insuf_pmid2  text,
       	haplo_insuf_pmid3  text,
       	triplosense_score  text, 
       	triplosense_desc   text
); 
call utf8_unicode('clingen_gene_curation_list');

call log('ClinGen gene_curation_list','done'); 
-- ###################################
call log('ClinGen gene_curation_list','done'); 
