#!/bin/bash
python3 -m venv /home/ec2-user/dsc
source /home/ec2-user/dsc/bin/activate
pip install 'dask[complete]'
pip install dask-ml
pip install dask_ml
pip install sklearn
pip install s3fs
pip install pyarrow
pip install awscli --upgrade
git clone https://github.com/rdszhao/DSC102_Project.git /home/ec2-user/DSC102_Project