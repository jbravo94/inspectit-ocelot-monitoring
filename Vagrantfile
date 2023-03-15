Vagrant.configure("2") do |config|

    # Box
    config.vm.box = "jhheinzl/inspectit-ocelot"
    config.vm.box_version = "0.0.1"
  
    # General
    config.vm.define "inspectit-ocelot"
  
    # Hardware
    config.vm.provider :virtualbox
    config.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = 4096
      vb.name = "inspectit-ocelot"
    end
    
    # Network
    config.vm.network "forwarded_port", guest: 8090, host: 8090, id: "ocelot-config-server"
    config.vm.network "forwarded_port", guest: 8085, host: 8085, id: "ocelot-eum-server"
    config.vm.network "forwarded_port", guest: 8086, host: 8086, id: "influxdb"
    config.vm.network "forwarded_port", guest: 8888, host: 8888, id: "chronograf"
    config.vm.network "forwarded_port", guest: 14268, host: 14268, id: "jaeger-collector"
    config.vm.network "forwarded_port", guest: 16686, host: 16686, id: "jaeger-query"
    config.vm.network "forwarded_port", guest: 5601, host: 5601, id: "kibana"
    config.vm.network "forwarded_port", guest: 3000, host: 3000, id: "grafana"
  
  end
  