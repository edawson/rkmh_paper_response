./DWGSIM/dwgsim -y 0 -N 250000 -c 2 -S 2 -H -z 42 -o 0 -r 0 -1 250 -2 250 -e 0.01 -E 0.01 -f TACGTACGTCTGAGCATCGATCGATGTACAGC -P $(basename $1 .fa) $1 reads/$(basename $1 .fa).IONTorrent.250bp
