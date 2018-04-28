#PBS -k oe #Keep the output and errors from the run
#PBS -l nodes=1:ppn=8,vmem=50gb,walltime=5:00:00
#PBS -M gibsomat@iu.edu
#PBS -m abe # Get notifications for the job
#PBS -N map_tags_jal

cd /N/dc2/projects/gibsonTomato/gbs_pipeline

module load bwa

bwa index -a bwtsw /N/dc2/projects/gibsonTomato/jal_genome/jalt_assembly.fa

bwa mem -t 8 /N/dc2/projects/gibsonTomato/jal_genome/jalt_assembly.fa /N/dc2/projects/gibsonTomato/gbs_pipeline/TagExport/tagsForAlign.fa.gz
