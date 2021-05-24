#cloud-boothook
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
export AWS_ACCESS_KEY_ID=ASIAUN7XKOYGANHWYA7I
export AWS_SECRET_ACCESS_KEY=nzZoGrCu81yXLSDtb3ERsPie0rlqHQo+xu22bd9n
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEFgaDH1/TUM4TVz0m3mNBCKrAR7GNVmoBtRt5n3KNpDdstqy31d9EXTltTTRb6B9gmqm2vudn4YO40mlcWMRkE1wkdmZOZsWnAyzR71DSXB7rbz5F2TMan4zl13iQf6LKTZ66sBdpcHL1Z0wJiARgfTsC0UgWqqITnqb6c1nl/ZW3MNG/g5qxOo+MIrIYmwXErFte+mqj0YU3CvkxBLE/WfYIxBani/Uc7rNr3SKO4/pyHPUlFaoCBTY9C6L7Cj7oquFBjItRK6CM3MrHorEpomRq5TbiW9VqGhBKGMDCnF8KOicHqdBAvnhKs7duAELDkLu
python3 -m venv dsc
source dsc/bin/activate
pip install dask
pip install awscli --upgrade --user
echo 'init complete'