red=$(tput setaf 1); blue=$(tput setaf 4); normal=$(tput sgr0); N=50; redlim=$(($N / 2)); dt=0; while [ $dt -lt $N ]; do start=$SECONDS; tweet=""; while [ ${#tweet} -le $N ]; do read -rsn1 -t 0.1; c=$REPLY; dt=$(($SECONDS - $start)); if `[ $dt -lt $redlim ]`; then col=$blue; else col=$red; fi; printf -- "|$tweet| ${#tweet}/$N ${col}$(($N-$dt))s left ${normal}\r"; if [ "$c" = $'\177' ]; then tweet=${tweet::-1}; elif `[ "$c" != "" ]`; then tweet+=$c; fi; done; printf "\ntweet took $dt seconds!\n"; echo -n ${tweet::-1} | xclip -selection c; done; echo "${red}YOU SUCK"
