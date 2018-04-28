#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=124gb,walltime=120:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N DiscoverySNPCallerPlugin

cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xmx96g -fork1 -DiscoverySNPCallerPluginV2 -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -mnLCov 0.1 -mnMAF 0.01 -maxTagsCutSite 100 -deleteOldData true -endPlugin -runfork1
