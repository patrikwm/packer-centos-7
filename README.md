# Packer Example - CentOS 7 minimal Vagrant and Vsphere Box using Ansible provisioner

**Current CentOS Version Used**: 7.5 (1804)

**Pre-built Vagrant Box**:

  - [`vagrant init geerlingguy/centos7`](https://vagrantcloud.com/geerlingguy/boxes/centos7)
  - See older versions: http://files.midwesternmac.com/

This example build configuration installs and configures CentOS 7 x86_64 minimal using Ansible, and then generates a Vagrant box file for VirtualBox or a VMware vSphere template.

The example can be modified to use more Ansible roles, plays, and included playbooks to fully configure (or partially) configure a box file suitable for deployment for development environments.

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/) (if you want to build the VirtualBox box)
  - [Ansible](http://docs.ansible.com/intro_installation.html)
  - [OVFTOOL](https://code.vmware.com/tool/ovf/4.3.0) (v4+)
  - [VMware Fusion](https://my.vmware.com/web/vmware/info/slug/desktop_end_user_computing/vmware_fusion/10_0) (only tested with VMware Fusion 10)
  - [vagrant-vsphere](https://github.com/nsidc/vagrant-vsphere)
  - [vagrant-json](https://github.com/Bauer-Xcel-Media/vagrant-json-config)

## Usage

### Vagrant

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ packer build -var 'version=1.2.0' centos7.json

After a few minutes, Packer should tell you the box was generated successfully, and the box was uploaded to Vagrant Cloud.

> **Note**: This configuration includes a post-processor that pushes the built box to Vagrant Cloud (which requires a `VAGRANT_CLOUD_TOKEN` environment variable to be set); remove the `vagrant-cloud` post-processor from the Packer template to build the box locally and not push it to Vagrant Cloud. You don't need to specify a `version` variable either, if not using the `vagrant-cloud` post-processor.

### vSphere

Create a variables.json file with correct variables. See variables.json_example for needed variables. VMware Version is set to 13 = ESXi 6.5 and later

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ packer build -var-file=variables.json vsphere_centos7.json

## Testing built boxes

There's an included Vagrantfile that allows quick testing of the built Vagrant boxes. From this same directory, run one the following command after building the box:

    $ vagrant up vagrantbox

To test the vsphere template run following commands.

    $ vagrant plugin install vagrant-vsphere
    $ vagrant plugin install vagrant-json-config
    $ vagrant up vspherebox

## License

MIT license.

## Author Information

Updated to use vSphere vCenter 2018 Patrik Wigur Martin
Created in 2014 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
