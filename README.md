Run 'vagrant up'
It will create two machines:
192.168.100.11 sofa1
192.168.100.12 soube2

The network and script definitions are inside the Vagrantfile

Once finished, we will have made some small changes at the system level, and we will have installed Ansible on soufe1, which will be responsible for deploying haproxy on itself in reverse proxy mode on port 8080, and grafana and prometheus on soube2 (the two services behind the reverse proxy), all as a container, using the podman module.
Test correct operation by invoking http://192.168.100.11:8080 calls
Furthermore, it should be possible to reach the services via the web, both from soufe1 and from soube2.
The listening ports are:
- 8080 for haproxy
- 9090 for prometheus
- 3000 grafana
