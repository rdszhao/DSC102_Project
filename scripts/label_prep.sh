source /home/ec2-user/dsc/bin/activate
aws emr create-cluster --name "label creation" \
    --release-label emr-5.33.0 \
    --applications Name=Spark \
    --log-uri s3://ds102-ray-scratch/logs/ \
    --ec2-attributes KeyName=ray-key \
    --instance-type m5.xlarge \
    --instance-count 3 \
    --steps Type=Spark,Name="spark job",ActionOnFailure=CONTINUE,Args=[--deploy-mode,cluster,--master,yarn,s3://ds102-rayz-scratch/label_prep.py] \
    --use-default-roles \
    --auto-terminate