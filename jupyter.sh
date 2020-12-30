#!/bin/sh

echo "FIRST STEP"
ssh mine "cd $1;jupyter-lab --no-browser --port=$2" &

echo "SECOND STEP"
ssh -N -f -L localhost:$2:localhost:$2 mine 

echo "Now go to browser and type localhost:$2. You will need the token that jupyter outputs as well"
