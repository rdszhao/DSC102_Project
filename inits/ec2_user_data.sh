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
export AWS_ACCESS_KEY_ID=ASIAUN7XKOYGNLBLI54V
export AWS_SECRET_ACCESS_KEY=iaaqMNmAYvsiMvAglgTxKobF/43w5IUMa1vQ+MMT
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEMr//////////wEaDDKx9j5Oth/4i/4gXiKrAavQIIlS0RgL7F7BpEHrY4yLonLfQ365FokoML1P9KxLjm7xwHs5Su/3s/XZT+9t1IjkOlYrwNDa5AmDXsaKAVszgBuzrbK8Z5mm8I/Q2NMYeBBKhBRIQAquU2yiVyjmnXe8apQqnTXZ2OE9g7aFJLjm/8W6LyRl2sbV9dCG6r2Fn2vT+MXuJFsZlJpdzWSO2uNJiPaq4Wp2uwwj8A+BKc3vvlvVIEa2gx+6qSj7v8SFBjItU2gVSlXS/mU4n1OL0TVgp9NZWjRQzV9nBG4xq4fACb/TliTq1id+0c8Y+o0M
aws s3 cp s3://ds102-rayz-scratch/ec2_init.sh ec2_init.sh
source ec2_init.sh