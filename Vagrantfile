Vagrant.configure("2") do |config|

  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  config.vm.define "cd" do |d|
    d.vm.box = "centos/7"
    d.vm.hostname = "cd"
    d.vm.network "private_network", ip: "10.100.198.100"
    d.vm.provision :shell, path: "scripts/bootstrap_ansible.sh"
    d.vm.provision :shell, inline: 'PYTHONUNBUFFERED=1 ansible-playbook -vvv /vagrant/ansible/cd.yml -c local'
    d.vm.provider "virtualbox" do |v|
          v.memory = 2048
    end
  end

  # if Vagrant.has_plugin?("vagrant-vbguest")
  #   config.vbguest.auto_update = false
  #   config.vbguest.no_install = false
  #   config.vbguest.no_remote = true
  # end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
