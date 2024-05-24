#!/bin/bash

start_time=$(date +%s)

end_time=$((start_time + 3600))

counter=0
duration_time_counter=0


while [ $(date +%s) -lt $end_time ]; do
  echo "========================================================================"
  command_start_time=$(date +%s)
  
  curl --location --request POST 'https://esbgds.atishahr.net:1680/api/v1/place_info/CityList' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwidXNlcm5hbWUiOiI1NjAyMjIwMDYwMDAxMTEzIiwiZXhwIjoxNzE3MjQ3MzU3LjkyOTYzNn0.IuAs37pl3kU7w3NnqEXsln4GhW4BPkLT2dLOYSvhHcw' \
--data-raw '{
  "province_id": 1
}'
  counter=$((counter + 1))

  command_end_time=$(date +%s)
  
  command_duration=$((command_end_time - command_start_time))
  duration_time_counter=$((duration_time_counter + command_duration))
  echo "========================================================================"

  echo "duration time is " $command_duration

  echo "========================================================================"
  if [ $(date +%s) -ge $end_time ]; then
    break
  fi
done
echo "count of curls" $counter
echo "total time for all curls" $duration_time_counter
echo "average is " $((duration_time_counter / counter))