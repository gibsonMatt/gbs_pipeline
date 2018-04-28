#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=1,vmem=220gb,walltime=60:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N GBSSeqToTagDB

cd /N/dc2/projects/gibsonTomato/gbs_pipeline

./tassel-5-standalone/run_pipeline.pl -Xms100G -Xmx200G -GBSSeqToTagDBPlugin -e MseI -i /N/dc2/projects/gibsonTomato/gbs_pipeline/RawData -db /N/dc2/projects/gibsonTomato/gbs_pipeline/jal_gbs.db -k /N/dc2/projects/gibsonTomato/gbs_pipeline/keysFile.txt -kmerLength 64 -minKmerL 20 -mnQS 20 -mxKmerNum 100000000 -endPlugin
