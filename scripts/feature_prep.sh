export AWS_DEFAULT_REGION=us-west-2
python3 /home/ec2-user/DSC102_Project/modules/feature_prep.p
aws s3 cp /home/ec2-user/DSC102_Project/modules/features_parquet s3://ds102-rayz-scratch/features_parquet --recursive
# rm -r /home/ec2-user/DSC102_Project/modules/features_parquet