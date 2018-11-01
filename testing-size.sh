#!/bin/bash

python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/size400" --image_size 400 --num_iter 10 
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/size700" --image_size 700 --num_iter 10
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/size1000" --image_size 1000 --num_iter 10 


