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
export AWS_ACCESS_KEY_ID=ASIAUN7XKOYGMTFT6JL7
export AWS_SECRET_ACCESS_KEY=yQ6bQA2bM9ooGVxIF+liH83GB6zZ4Mkr78bUn1RC
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEG4aDOUamk82eUj69EITXCKrAcKywQfEbya37pvWQ4vVr9QT+5rHfR7Z3LTtVqG9PCUs5Edpo/fZZj/GTSDRTC05Jc1OC1YJ2Fs9iZuUUfOGmtBhqmensXLcBuIxJQKYtdHZK312rroycLbULsWXT2SKnl5DM/6U5PcT3OFgcR/IlJv/m/umLdEnR/soLNwWJ3FSb5CL/pq9lpQIiiA8SOnb6vmuGuhDNlFA27/Y2i1yx86lDAZkS/pgDGBrViiEkbCFBjIt5NDdtMhY+1/T3KmWqkkpdFmkqE/NE1bLm/kqxBwhjGDHmYTPic7FdYnd4vhz
aws s3 cp s3://ds102-rayz-scratch/ec2_init.sh ec2_init.sh
source ec2_init.sh
cd /
echo 'init complete'