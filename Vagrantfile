# -*- mode: ruby -*-
# vi: set ft=ruby :
VM_ID = "vagrant"
NUM_WORKER_NODES = 2
IP_NW = "192.168.11."
IP_START=20

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = true

# Single Control-Plane node
  config.vm.define "#{VM_ID}-master" do |node|
    node.vm.provider "virtualbox" do |vb|
      vb.name = "#{VM_ID}-master"
      vb.memory = 3000
      vb.cpus = 2
    end
    node.vm.hostname = "#{VM_ID}-master"
    node.vm.network "private_network", ip: "192.168.11.10"

    node.vm.provision "setup-hosts", :type => "shell", :path => "scripts/setup-hosts.sh" do |s|
      s.args = ["enp0s8"]
    end
    node.vm.provision "install_controlplane", type: "shell", :path => "scripts/install_controlplane.sh" do |s|
      s.args = ["enp0s8"]
    end
  end

# Worker nodes
  (1..NUM_WORKER_NODES).each do |i|
    config.vm.define "#{VM_ID}-worker-#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.name = "#{VM_ID}-worker-#{i}"
        vb.memory = 2048
        vb.cpus = 2
      end
      node.vm.hostname = "#{VM_ID}-worker-#{i}"
      node.vm.network "private_network", ip: IP_NW + "#{IP_START + i}"

      node.vm.provision "setup-hosts", :type => "shell", :path => "scripts/setup-hosts.sh" do |s|
        s.args = ["enp0s8"]
      end

      node.vm.provision "install_node", type: "shell", :path => "scripts/install_node.sh"
      node.vm.provision "join-cluster", type: "shell", :path => "scripts/kubeadm-join.sh"
    end
  end
end
