VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # config.vm.box = "ubuntu/trusty64"
  config.vm.box = "chef/ubuntu-14.04"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=777','fmode=766']

  config.vm.provider "virtualbox" do |v|
  v.memory = 512
    v.cpus = 1
  end

  config.vm.provision :shell, path: "vagrant/bootstrap.sh"

end
