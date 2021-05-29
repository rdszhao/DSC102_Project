source /home/ec2-user/dsc/bin/activate
export AWS_DEFAULT_REGION=us-west-2
sh /home/ec2-user/DSC102_Project/scripts/feature_prep.sh
aws s3 cp /home/ec2-user/DSC102_Project/modules/features_parquet s3://ds102-rayz-scratch/features_parquet --recursive
# rm -r /home/ec2-user/DSC102_Project/modules/features_parquet
sh /home/ec2-user/DSC102_Project/scripts/label_prep.sh
sh /home/ec2-user/DSC102_Project/scripts/model.sh