-- begin create tables 

call log('create_tables.sql', 'begin');

-- #############################################
call log('bic_brca1', 'Breast Information Core (BRCA1)  '); 

drop table if exists bic_brca1; 
create table bic_brca1 (
       Accession   text default null, 
       Exon	   text default null, 
       NT	   text default null, 
       Codon	   text default null, 
       BaseChange      varchar(25)  default null, 
       AAChange	       varchar(25)  default null, 
       Designation     varchar(25)  default null ,
       HGVS_c_posedit  varchar(150) default null, 
       HGVS_p_posedit  varchar(150) default null, 
       HGVS_g_posedit  varchar(150) default null, 
       Genotype        varchar(25)  default null, 
       dbsnp           varchar(25)  default null, 
       MutationType    varchar(20)  default null, 
       ClinicallySignificant  text  default null, 
       Category               text  default null, 
       Evidence               text  default null, 
       Depositor              text  default null, 
       PatientSample          text  default null, 
       IDNumber               text  default null, 
       NumReported            text  default null, 
       G_or_S                 text  default null, 
       DetectionMethod        text  default null, 
       ProbandTumor           text  default null, 
       NumChromScreened       text  default null, 
       A           text default null,
       C           text default null,
       G           text default null,
       T           text default null,
       Reference   text default null,
       Contact     text default null,
       Notes       text default null,
       CreateDate  text default null,
       Ethnicity   text default null,
       Nationality text default null,
       Additional  text default null
);

call utf8_unicode('bic_brca1'); 

-- #############################################
call log('bic_brca2', 'Breast Information Core (BRCA2)  '); 

drop table if exists bic_brca2; 
create table bic_brca2 like bic_brca1; 

-- #############################################
call log('lovd_installation', 'LOVD Installations'); 

-- # Header:
-- # "Date last seen"	      "Version"		     "# genes"	"# individuals"	"# variants"	"# unique variants"	"DB name" "DB location" "Genes"
drop table if exists lovd_installation; 
create table lovd_installation (
       DateLastSeen	       date default null,
       Version		       varchar(25) default null,
       NumGenes	       	       int default null,
       NumIndividuals	       int default null,
       NumVariants	       int default null,
       NumUniqueVariants       int default null,
       DbName		       varchar(125) default null,
       DbLocation	       varchar(125) default null,
       Genes		       longtext default null
);

call utf8_unicode('lovd_installation'); 

-- #############################################
call log('create_tables.sql', 'done');
