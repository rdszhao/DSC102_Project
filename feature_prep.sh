aws s3 cp s3://ds102-rayz-scratch/q1.txt /home/ec2-user/dsc102_project/data/q1.txt
python3 feature_prep.py
aws s3 cp features.parquet s3://ds102-rayz-scratch/features.parquet