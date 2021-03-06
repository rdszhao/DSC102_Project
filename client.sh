aws ec2 run-instances \
    --launch-template LaunchTemplateId=lt-0931323da9297894e
sleep 100s
instanceid=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
address=$(aws ec2 describe-instances --instance-ids $instanceid --query "Reservations[*].Instances[*].PublicDnsName" --output text)
ssh -o StrictHostKeyChecking=no -i '~/aws-keys/ray-key.pem' ec2-user@$address 'sh /home/ec2-user/DSC102_Project/scripts/main.sh'
aws ec2 terminate-instances --instance-ids $instanceid