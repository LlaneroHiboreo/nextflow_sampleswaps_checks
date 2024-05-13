#!/bin/bash

nextflow run /home/ec2-user/nextflow_swaps_identification/main.nf \
-profile awsbatcher \
--tools somalier \
--input /home/jgaztelu/AWS/nextflow_swaps_identification/assets/samplesheet.csv \
--outdir results \
--fasta https://raw.githubusercontent.com/nf-core/test-datasets/modules//data/genomics/homo_sapiens/genome/chr21/sequence/genome.fasta \
--fai https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/genomics/homo_sapiens/genome/chr21/sequence/genome.fasta.fai \
--sites s3://mynewuniquenamebucket/sites.hg38.vcf.gz \
-w s3://mynewuniquenamebucket/work