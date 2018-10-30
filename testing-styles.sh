#!/bin/bash

python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/styleA" --image_size 500 --num_iter 10
python Network.py "input/test.jpg" "test-styles/B.jpg" "test-results/styleB" --image_size 500 --num_iter 10
python Network.py "input/test.jpg" "test-styles/C.jpg" "test-results/styleC" --image_size 500 --num_iter 10
python Network.py "input/test.jpg" "test-styles/D.jpg" "test-results/styleD" --image_size 500 --num_iter 10
python Network.py "input/test.jpg" "test-styles/E.jpg" "test-results/styleE" --image_size 500 --num_iter 10
python Network.py "input/test.jpg" "test-styles/F.jpg" "test-results/styleF" --image_size 500 --num_iter 10 


