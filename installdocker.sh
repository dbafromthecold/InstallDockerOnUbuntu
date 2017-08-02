#
# install docker community edition
# code from https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository1
#

sudo apt-get update -y

sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get update -y

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

sudo apt-get install -y docker-ce

#
# install sql command line tools
# code from https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools#ubuntu
#

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

sudo apt-get update -y

sudo apt-get install mssql-tools unixodbc-dev

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

exec bash

#
# pull latest SQL Server on Linux image from Docker Hub
#

sudo docker pull microsoft/mssql-server-linux:latest
