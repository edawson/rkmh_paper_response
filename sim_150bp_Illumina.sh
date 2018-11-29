./DWGSIM/dwgsim -y 0 -N 250000 -c 0 -S 2 -H -z 42 -o 2 -r 0 -1 150 -2 150 -e 0.005 -E 0.005 -P $(basename $1 .fa) $1 reads/$(basename $1 .fa).illumina.150bp
