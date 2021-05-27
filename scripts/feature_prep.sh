source /home/ec2-user/dsc/bin/activate
source /home/ec2-user/DSC102_Project/scripts/credentials.sh
aws s3 cp s3://ds102-rayz-scratch/q1.txt /home/ec2-user/DSC102_Project/modules/q1.txt
python3 /home/ec2-user/DSC102_Project/modules/feature_prep.py
aws s3 cp /home/ec2-user/DSC102_Project/modules/features_parquet s3://ds102-rayz-scratch/features_parquet --recursive
rm /home/ec2-user/DSC102_Project/modules/q1.txt
rm -r /home/ec2-user/DSC102_Project/modules/features_parquet