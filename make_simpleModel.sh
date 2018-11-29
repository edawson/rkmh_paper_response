python simple_mutator/simple_mutator.py ./rkmh/data/hpv_16.fa 0.5 A && \
    python simple_mutator/simple_mutator.py ./rkmh/data/hpv_16.fa 1.0 B && \
    python simple_mutator/simple_mutator.py ./rkmh/data/hpv_16.fa 2.5 C && \
    python simple_mutator/simple_mutator.py A.fa 0.05 A1 && \
    python simple_mutator/simple_mutator.py A.fa 0.1 A2 && \
    python simple_mutator/simple_mutator.py A.fa 0.25 A3 && \
    python simple_mutator/simple_mutator.py B.fa 0.05 B1 && \
    python simple_mutator/simple_mutator.py B.fa 0.1 B2 && \
    python simple_mutator/simple_mutator.py B.fa 0.25 B3 && \
    python simple_mutator/simple_mutator.py C.fa 0.05 C1 && \
    python simple_mutator/simple_mutator.py C.fa 0.1 C2 && \
    python simple_mutator/simple_mutator.py C.fa 0.25 C3

cat A.fa B.fa C.fa > lineage_simpleModel.refs.fa && sed -i "s/^> />/g" lineage_simpleModel.refs.fa

cat A1.fa A2.fa A3.fa B1.fa B2.fa B3.fa C1.fa C2.fa C3.fa > sublineage_simpleModel.refs.fa && sed -i "s/^> />/g" sublineage_simpleModel.refs.fa


rm -rf jfile.txt

for i in A1 A2 A3 B1 B2 B3 C1 C2 C3
do
    echo "./sim_75bp_Illumina.sh ${i}.fa" >> jfile.txt
done

python ~/sandbox/LaunChair/launcher.py -i jfile.txt -c 1

rm -rf jfile.txt

for i in A1 A2 A3 B1 B2 B3 C1 C2 C3
do
    echo "./sim_150bp_Illumina.sh ${i}.fa" >> jfile.txt
done

python ~/sandbox/LaunChair/launcher.py -i jfile.txt -c 1

rm -rf jfile.txt


for i in A1 A2 A3 B1 B2 B3 C1 C2 C3
do
    echo "./sim_250bp_IonTorrent.sh ${i}.fa" >> jfile.txt
done

python ~/sandbox/LaunChair/launcher.py -i jfile.txt -c 1

rm -rf jfile.txt


for i in A1 A2 A3 B1 B2 B3 C1 C2 C3
do
    echo "./sim_5000bp_PacBio.sh ${i}.fa" >> jfile.txt
done

python ~/sandbox/LaunChair/launcher.py -i jfile.txt -c 1

rm -rf jfile.txt


for i in A1 A2 A3 B1 B2 B3 C1 C2 C3
do
    echo "./sim_5000bp_MultiPass.sh ${i}.fa" >> jfile.txt
done

python ~/sandbox/LaunChair/launcher.py -i jfile.txt -c 1

rm -rf jfile.txt

## Make read files a single file
cat reads/*75bp.bfast.fastq.gz > reads_75bp_simpleModel.fq.gz
cat reads/*150bp.bfast.fastq.gz > reads_150bp_simpleModel.fq.gz
cat reads/*250bp.bfast.fastq.gz > reads_250bp_simpleModel.fq.gz
cat reads/*5000bp.pacbio.fq.fastq | gzip > reads_5000bp_simpleModel.fq.gz
cat reads/*5000bp.multipass.fq.fastq | gzip > reads_5000bp_MultiPass_simpleModel.fq.gz


