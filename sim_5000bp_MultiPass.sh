simlord --read-reference $1 --no-sam  -n 20000 -fl 5000 -pi 0.01 -pd 0.01 -ps 0.01 reads/$(basename $1 .fa).5000bp.multipass.fq
