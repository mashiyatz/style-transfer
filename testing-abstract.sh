#!/bin/bash

python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio4" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 0.25
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio40" --image_size 500 --num_iter 10 --style_weight 10 --content_weight 0.25
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio400" --image_size 500 --num_iter 10 --style_weight 100 --content_weight 0.25
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio4000" --image_size 500 --num_iter 10 --style_weight 1000 --content_weight 0.25
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio1" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 1
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio01" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 10
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio001" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 100
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio0001" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 1000


