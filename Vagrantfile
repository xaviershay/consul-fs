# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT

sudo apt-get update

echo Installing dependencies...
sudo apt-get install -y unzip curl

echo Fetching Consul...
cd /tmp/
wget https://dl.bintray.com/mitchellh/consul/0.3.1_linux_amd64.zip -O consul.zip

echo Installing Consul...
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul

echo Installing Ruby
sudo apt-get install python-software-properties -y
sudo apt-add-repository ppa:brightbox/ruby-ng -y
sudo apt-get update

sudo apt-get install ruby2.1 ruby2.1-dev fuse libfuse-dev make -y

sudo gem2.1 install bundler
SCRIPT

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.provision "shell", inline: $script

  config.vm.define "n1" do |n1|
      n1.vm.hostname = "n1"
      n1.vm.network "private_network", ip: "172.20.20.10"
  end
end
