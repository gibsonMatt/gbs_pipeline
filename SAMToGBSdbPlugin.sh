#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=2,vmem=30gb,walltime=10:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N SAMToGBS

cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xmx24g -fork1 -SAMToGBSdbPlugin -i /N/dc2/projects/gibsonTomato/gbs_pipeline/aligned/aligned-tags.sam -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -aProp 0.0 -aLen 0 -endPlugin -runfork1
