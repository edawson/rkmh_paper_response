## 75bp reads
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -r lineage_simpleModel.refs.fa -f reads_75bp_simpleModel.fq.gz > lineage_75bp_simpleModel.k16.s1000.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_75bp_simpleModel.fq.gz > lineage_75bp_simpleModel.k16.s1000.m100.i1.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 8000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_75bp_simpleModel.fq.gz > lineage_75bp_simpleModel.k16.s8000.m100.i1.N5.rk

## 150bp
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -r lineage_simpleModel.refs.fa -f reads_150bp_simpleModel.fq.gz > lineage_150bp_simpleModel.k16.s1000.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_150bp_simpleModel.fq.gz > lineage_150bp_simpleModel.k16.s1000.m100.i1.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 8000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_150bp_simpleModel.fq.gz > lineage_150bp_simpleModel.k16.s8000.m100.i1.N5.rk

## 250bp
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -r lineage_simpleModel.refs.fa -f reads_250bp_simpleModel.fq.gz > lineage_250bp_simpleModel.k16.s1000.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_250bp_simpleModel.fq.gz > lineage_250bp_simpleModel.k16.s1000.m100.i1.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 8000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_250bp_simpleModel.fq.gz > lineage_250bp_simpleModel.k16.s8000.m100.i1.N5.rk

## 5000bp w/ error
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -r lineage_simpleModel.refs.fa -f reads_5000bp_simpleModel.fq.gz > lineage_5000bp_simpleModel.k16.s1000.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_5000bp_simpleModel.fq.gz > lineage_5000bp_simpleModel.k16.s1000.m100.i1.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 8000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_5000bp_simpleModel.fq.gz > lineage_5000bp_simpleModel.k16.s8000.m100.i1.N5.rk

## 5000bp multipass low-error
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -r lineage_simpleModel.refs.fa -f reads_5000bp_MultiPass_simpleModel.fq.gz > lineage_5000bp_MultiPass_simpleModel.k16.s1000.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 1000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_5000bp_MultiPass_simpleModel.fq.gz > lineage_5000bp_MultiPass_simpleModel.k16.s1000.m100.i1.N5.rk && \
time ./rkmh/rkmh stream -t 4 -N 5 -k 16 -s 8000 -M 100 -I 1 -r lineage_simpleModel.refs.fa -f reads_5000bp_MultiPass_simpleModel.fq.gz > lineage_5000bp_MultiPass_simpleModel.k16.s8000.m100.i1.N5.rk 
