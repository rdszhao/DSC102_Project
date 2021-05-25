#!/bin/bash
python3 -m venv dsc
source dsc/bin/activate
pip install dask
pip install dask_ml
pip install numpy
pip install sklearn
pip install s3fs
pip install awscli --upgrade
git clone https://github.com/rdszhao/DSC102_Project.git
echo 'init complete'