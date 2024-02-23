Vagrant.configure("2") do |config|
  # Configurazione della seconda macchina virtuale
  config.vm.define "soube2" do |soube2|
    soube2.vm.box = "generic/rocky9"
    soube2.vm.hostname = "soube2"
    soube2.vm.network "private_network", ip: "192.168.100.12"
    soube2.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end
    soube2.vm.provision "shell", path: "script2.sh", privileged: false
  end

  # Configurazione della prima macchina virtuale
  config.vm.define "soufe1" do |soufe1|
    soufe1.vm.box = "generic/rocky9"
    soufe1.vm.hostname = "soufe1"
    soufe1.vm.network "private_network", ip: "192.168.100.11"
    soufe1.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end

    soufe1.vm.synced_folder ".", "/vagrant", type: "rsync"
    soufe1.vm.provision "shell", path: "script.sh", privileged: false
#    soufe1.vm.provision "ansible_local" do |ansible|
#      ansible.playbook = "/vagrant/deploy.yml"
  end
end
