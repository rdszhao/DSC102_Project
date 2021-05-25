export AWS_ACCESS_KEY_ID=ASIAUN7XKOYGIGUSHFUS
export AWS_SECRET_ACCESS_KEY=cwUUF2NOQDOGnlmPTyB7J52zVN1sEQiVhM+VedS/
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEIP//////////wEaDH9U1+yqiZhSxefwsCKrARzCCxKAR2PDltzZkCXDGWj8oI3C52XIE5rZDz02khKu5ih7PmnPGP2NiAIuteUrOHErYdr6tC/RX2tkUFuKy/y/ufALWxeAfWwqQFlMUD7e1zLZbR+BxvZEGWgLPB7PmR3QGiJv/pjlg5NamQ1/WIDGpzDPOcJsJVKxU8B9I9e1hhStOaxXhOfvV0Fl9JYE+67BBYYxUHSu0C/XDBeVZwf4PXRsfMEKct9R4SiM4bSFBjItiZbW2laPiy3uhDMCUGoZpzmxd/0cJiPDlK0M4EKofMn9XlMVwk9j9/WKWYLA
aws s3 cp s3://ds102-rayz-scratch/q1.txt /home/ec2-user/dsc102_project/q1.txt
python3 feature_prep.py
aws s3 cp features.parquet s3://ds102-rayz-scratch/features.parquet
rm q1.txt
rm -r features.parquet