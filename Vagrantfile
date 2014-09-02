VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :private_network, ip: "10.0.0.100"
  
  config.vm.synced_folder "./", "/var/www/"
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
  end
  
  config.vm.provision :shell do |shell|
    shell.path = "bootstrap.sh"
  end
end