#!/bin/bash

sudo docker run -t -i --rm \
  -v /var/run/docker.sock:/run/docker.sock \
  -v $(which docker):/bin/docker \
  -v $(pwd):/current_dir \
   viatcheslavmogilevsky/suprise:0.0.1