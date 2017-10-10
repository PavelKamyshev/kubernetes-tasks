Vagrant.configure("2") do |config|
	config.vm.box_check_update = false
		
	config.vm.define "master" do |master|
		master.vm.box = "ubuntu/xenial64"
		master.vm.network "public_network"
		master.vm.network "private_network", ip: "10.10.1.10",
			virtualbox__intnet: true
#		master.vm.network "forwarded_port", guest: 8001, host: 30001
#		master.vm.network "forwarded_port", guest: 80, host: 30002
		master.vm.hostname = "kamyshevkubemaster"
		master.vm.provider "virtualbox" do |vb|
			vb.name = "ubuntu_kubemaster"
			vb.memory = "2048"
			vb.cpus = 2
		master.vm.provision "shell", path: "master.sh", privileged: true
		end
	end
		
	config.vm.define "node" do |node|
		node.vm.box = "ubuntu/xenial64"
		node.vm.network "public_network"
		node.vm.network "private_network", ip: "10.10.1.11",
			virtualbox__intnet: true
		node.vm.hostname = "kamyshevkubenode"
		node.vm.provider "virtualbox" do |vb|
			vb.name = "ubuntu_kubenode"
			vb.memory = "1024"
			vb.cpus = 1
		node.vm.provision "shell", path: "node.sh", privileged: true
		end	
	end
end