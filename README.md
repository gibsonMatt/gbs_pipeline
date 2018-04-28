# Jaltomata BC1 population GBS data processing using TASSEL GBS v2 Pipeline
Trying to build a better map than the current version

## GBSSeqTpTagDBPlugin

/N/dc2/projects/gibsonTomato/gbs_pipeline/GBSSeqToTagDB.sh

```
#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=200gb,walltime=60:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N GBSSeqToTagDB

cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xms100G -Xmx200G -GBSSeqToTagDBPlugin -e MseI -i /N/dc2/projects/gibsonTomato/gbs_pipeline/RawData -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -k /N/dc2/projects/gibsonTomato/gbs_pipeline/keysFile.txt -kmerLength 64 -minKmerL 20 -mnQS 20 -mxKmerNum 100000000 -endPlugin

```

## TagExportToFastqPlugin

/N/dc2/projects/gibsonTomato/gbs_pipeline/GBSSeqToTagDB.sh

```
#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=20gb,walltime=3:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N TagExport

cd /N/dc2/projects/gibsonTomato/gbs_pipeline


./tassel-5-standalone/run_pipeline.pl -fork1 -TagExportToFastqPlugin -db ./jal_gbs.db -o /N/dc2/projects/gibsonTomato/gbs_pipeline/TagExport/tagsForAlign.fa.gz -c 1 -endPlugin -runfork1
```

## Map to Meng's assembly

### Index genome

/N/dc2/projects/gibsonTomato/gbs_pipeline/align-tags.sh

```
bwa index -a bwtsw ~/jal_genome/jalt_assembly.fa
```

### Map with `bwa`

```
bwa mem -t 8 /N/dc2/projects/gibsonTomato/jal_genome/jalt_assembly.fa /N/dc2/projects/gibsonTomato/gbs_pipeline/TagExport/tagsForAlign.fa.gz > aligned-tags.sam
```

## Return mapped reads to database

/N/dc2/projects/gibsonTomato/gbs_pipeline/SAMToGBSdbPlugin.sh

```
./tassel-5-standalone/run_pipeline.pl -fork1 -SAMToGBSdbPlugin -i /N/dc2/projects/gibsonTomato/gbs_pipeline/aligned/aligned-tags.sam -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -aProp 0.0 -aLen 0 -endPlugin -runfork1
```

## DiscoverySNPCaller

/N/dc2/projects/gibsonTomato/gbs_pipeline/DiscoverySNPCallerPlugin.sh

```
cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xmx24g -fork1 -DiscoverySNPCallerPluginV2 -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -mnLCov 0.1 -mnMAF 0.01 -maxTagsCutSite 100 -deleteOldData true -endPlugin -runfork1
```
- This took >50 hours. Not sure why, but it finished. 


## Quality Profile and db update

/N/dc2/projects/gibsonTomato/gbs_pipeline/SNPQualityProfilerPlugin.sh

```
cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xmx24g -fork1 -SNPQualityProfilerPlugin -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -statFile SNP_stats.txt -endPlugin -runfork1

./tassel-5-standalone/run_pipeline.pl -Xmx24g -fork1 -UpdateSNPPositionQualityPlugin -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -endPlugin -runfork1
```

