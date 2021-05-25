Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
yum update -y
yum install git -y
export AWS_ACCESS_KEY_ID=ASIAUN7XKOYGIGUSHFUS
export AWS_SECRET_ACCESS_KEY=cwUUF2NOQDOGnlmPTyB7J52zVN1sEQiVhM+VedS/
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEIP//////////wEaDH9U1+yqiZhSxefwsCKrARzCCxKAR2PDltzZkCXDGWj8oI3C52XIE5rZDz02khKu5ih7PmnPGP2NiAIuteUrOHErYdr6tC/RX2tkUFuKy/y/ufALWxeAfWwqQFlMUD7e1zLZbR+BxvZEGWgLPB7PmR3QGiJv/pjlg5NamQ1/WIDGpzDPOcJsJVKxU8B9I9e1hhStOaxXhOfvV0Fl9JYE+67BBYYxUHSu0C/XDBeVZwf4PXRsfMEKct9R4SiM4bSFBjItiZbW2laPiy3uhDMCUGoZpzmxd/0cJiPDlK0M4EKofMn9XlMVwk9j9/WKWYLA
aws s3 cp s3://ds102-rayz-scratch/ec2_init.sh ec2_init.sh
source ec2_init.sh