#!/usr/bin/env bash

base_addr="http://127.0.0.1:8080"
declare -a endpoints=("books" "authors")

n_reqs=100000
parallelN=100

cleanup() {
  echo "Handling SIGINT"
  pkill -P $$ # kill parent and all his children
  exit 1
}

trap cleanup SIGINT

for endpoint in "${endpoints[@]}"; do
  seq 1 $n_reqs | xargs -n1 -P$parallelN sh -c "curl --retry 3 --retry-delay 5 --connect-timeout 5 --max-time 10 $base_addr/$endpoint" &
done

wait