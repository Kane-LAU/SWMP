#!/bin/bash
dataset=partnet2shapemotion
item=refrigerator
cd tools
python json2urdf.py --dataset=$dataset
python render_synthetic.py --dataset=$dataset --item=$item --num=30 --cnt=31 --pitch="-90,5" --roll="-10,10" --yaw="-180,180" --min_angles="-90" --max_angles="30"
python preprocess_data.py --dataset=$dataset --item=$item --collect --split
cd ../lib && python dataset.py --item=$item --dataset=$dataset --split --show_fig --config_file ../cfg/network_config.yml --gen
