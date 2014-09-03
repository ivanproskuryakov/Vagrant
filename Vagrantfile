VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|        

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise32"    
  
  config.vm.provision :shell, path: "bootstrap.sh"
  config.ssh.forward_agent = true
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "10.0.0.100" 
      
  # Set synced dir for vagrant enviroment     
  config.vm.synced_folder "www", "/vagrant/", id: "vagrant-root" ,  type: "nfs" 
     
  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file saucy64.pp in the manifests_path directory.                                  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "init.pp"
  end
  
  config.vm.provision :shell do |shell|
    shell.path = "bootstrap.sh"
  end
end           

                 