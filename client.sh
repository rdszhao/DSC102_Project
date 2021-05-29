source scripts/credentials.sh
aws ec2 run-instances \
    --launch-template LaunchTemplateId=lt-0931323da9297894e,Version=9
address=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].PublicDnsName" --output text)
ssh -o StrictHostKeyChecking=no -i '~/aws-keys/ray-key.pem' ec2-user@$address 'git clone https://github.com/rdszhao/DSC102_Project.git /home/ec2-user/DSC102_Project'
ssh -o StrictHostKeyChecking=no -i '~/aws-keys/ray-key.pem' ec2-user@$address '/home/ec2-user/DSC102_Project/scripts/main.sh'
# instanceid=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
# aws ec2 terminate-instances --instance-ids $instanceid