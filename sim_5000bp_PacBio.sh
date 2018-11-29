simlord --read-reference $1 --no-sam  -n 20000 -fl 5000 -pi 0.10 -pd 0.10 -ps 0.05 $(basename $1 .fa).5000bp.pacbio.fq
