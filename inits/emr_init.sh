yum update -y
yum install git -y
export AWS_ACCESS_KEY_ID=ASIAUN7XKOYGIGUSHFUS
export AWS_SECRET_ACCESS_KEY=cwUUF2NOQDOGnlmPTyB7J52zVN1sEQiVhM+VedS/
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEIP//////////wEaDH9U1+yqiZhSxefwsCKrARzCCxKAR2PDltzZkCXDGWj8oI3C52XIE5rZDz02khKu5ih7PmnPGP2NiAIuteUrOHErYdr6tC/RX2tkUFuKy/y/ufALWxeAfWwqQFlMUD7e1zLZbR+BxvZEGWgLPB7PmR3QGiJv/pjlg5NamQ1/WIDGpzDPOcJsJVKxU8B9I9e1hhStOaxXhOfvV0Fl9JYE+67BBYYxUHSu0C/XDBeVZwf4PXRsfMEKct9R4SiM4bSFBjItiZbW2laPiy3uhDMCUGoZpzmxd/0cJiPDlK0M4EKofMn9XlMVwk9j9/WKWYLA
python3 -m venv /home/ec2-user/dsc
source /home/ec2-user/dsc/bin/activate
pip install 'dask[complete]'
pip install sklearn
pip install s3fs
pip install awscli --upgrade
git clone https://github.com/rdszhao/DSC102_Project.git /home/ec2-user/DSC102_Project