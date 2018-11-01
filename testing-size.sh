#!/bin/bash

python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio4" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 0.25
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio40" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 0.025
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio400" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 0.0025
python Network.py "input/test.jpg" "test-styles/A.jpg" "test-results/ratio4000" --image_size 500 --num_iter 10 --style_weight 1 --content_weight 0.00025


