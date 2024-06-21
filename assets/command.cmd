#!/bin/bash

nextflow run /home/jgaztelu/AWS/nextflow_sampleswaps_checks/main.nf \
-profile awsbatcher \
--tools somalier \
--input s3://cnag-awssummit24-results/WGS/WGSTEST/samplesheet.csv \
--outdir s3://cnag-awssummit24-results/WGS/WGSTEST/results \
--aws_process_queue nxf-job-queue-6family-spot-detail \
--fasta s3://cnag-awssummit24-dbs/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta/GRCh38_full_analysis_set_plus_decoy_hla.altmasked.fasta \
--fai s3://cnag-awssummit24-dbs/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta/GRCh38_full_analysis_set_plus_decoy_hla.altmasked.fasta.fai \--aws_process_queue nxf-job-queue-6family-spot \
--aws_region eu-west-1 \
--sites s3://cnag-awssummit24-dbs/Homo_sapiens/GATK/GRCh38/Annotation/somalier/sites.hg38.vcf.gz \
-w s3://cnag-awssummit24-results/WGS/WGSTEST/work


nextflow run /home/jgaztelu/AWS/nextflow_sampleswaps_checks/main.nf \
-profile docker \
--tools somalier \
--input /home/jgaztelu/AWS/nextflow_sampleswaps_checks/assets/samplesheet.csv \
--outdir results \
--fasta https://raw.githubusercontent.com/nf-core/test-datasets/modules//data/genomics/homo_sapiens/genome/chr21/sequence/genome.fasta \
--fai https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/genomics/homo_sapiens/genome/chr21/sequence/genome.fasta.fai \
--sites s3://cnag-awssummit24-dbs/Homo_sapiens/GATK/GRCh38/Annotation/somalier/sites.hg38.vcf.gz \
-w work