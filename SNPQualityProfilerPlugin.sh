#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=12gb,walltime=10:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N SNPQualityProfilerPlugin--Update

cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xmx8g -fork1 -SNPQualityProfilerPlugin -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -statFile SNP_stats.txt -endPlugin -runfork1

./tassel-5-standalone/run_pipeline.pl -Xmx8g -fork1 -UpdateSNPPositionQualityPlugin -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -endPlugin -runfork1

