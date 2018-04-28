#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=220gb,walltime=40:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N ProductionSNPCaller

cd /N/dc2/projects/gibsonTomato/gbs_pipeline


./tassel-5-standalone/run_pipeline.pl -Xms100G -Xmx200G -fork1 -ProductionSNPCallerPluginV2 -e MseI -i /N/dc2/projects/gibsonTomato/gbs_pipeline/RawData -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -k /N/dc2/projects/gibsonTomato/gbs_pipeline/keysFile.txt -kmerLength 64 -mnQS 20 -d 1 -o /N/dc2/projects/gibsonTomato/gbs_pipeline/jalt_gbs_tassel_pipeline_raw.vcf -endPlugin -runfork1
