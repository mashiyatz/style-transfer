#!/bin/bash

python linear-color-transfer.py --target_image styles/yukored.jpg --source_image input/content.jpg --output_image output/style_colored.png

python lum-transfer.py --content_image input/content.jpg --style_image output/style_colored.png --cp_mode lum --output_style_image output/style_lum.png --output_content_image output/content_lum.png --org_content input/content.jpg

python Network.py "output/content_lum.png" "output/style_lum.png" "output/content" image_size 1000 --num_iter 20

python lum-transfer.py --output_lum2 output/content_at_iteration_20.png --cp_mode lum2 --output_image output/out_combined.png --org_content input/content.jpg

python linear-color-transfer.py --target_image output/out_combined.png --source_image input/content.jpg --output_image share/out_combined_color.png

