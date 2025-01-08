
Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/jammy64'
  config.vm.hostname = 'sonarqube'
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provider "virtualbox" do |v|
    v.memory = 10240
    v.cpus = 4    
    end
end