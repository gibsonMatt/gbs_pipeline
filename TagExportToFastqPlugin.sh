#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=20gb,walltime=3:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N TagExport

cd /N/dc2/projects/gibsonTomato/gbs_pipeline


./tassel-5-standalone/run_pipeline.pl -fork1 -TagExportToFastqPlugin -db ./jal_gbs.db -o /N/dc2/projects/gibsonTomato/gbs_pipeline/TagExport/tagsForAlign.fa.gz -c 1 -endPlugin -runfork1
