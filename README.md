# ansible-role-amazon-ssm

[![Build Status](https://travis-ci.com/diodonfrost/ansible-role-amazon-ssm.svg?branch=master)](https://travis-ci.com/diodonfrost/ansible-role-amazon-ssm)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.amazon_ssm-660198.svg)](https://galaxy.ansible.com/diodonfrost/amazon_ssm)

This role provide a compliance for install amazon-ssm on your target host.

## Requirements

This role was developed using Ansible 2.5 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.amazon_ssm` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 7
    - 6
- name: Fedora
  versions:
    - 30
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - buster
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - disco
    - bionic
    - xenial
    - trusty
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
    - 2013.09
- name: opensuse
  versions:
    - 13.2
    - 15.0
    - 15.1
- name: Windows
  versions:
    - 2016
    - 2012R2
    - 2008R2
```

## Role Variables

This role does not have a variable

```yaml
---
# defaults file for ansible-role-amazon-ssm

# Enable or disable sudo access for ssm-user on Linux instances
allow_sudo: true

```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy 
role in a localhost and installing latest amazon-ssm version.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.amazon_ssm
```

Remove sudo access to the ssm-user account on Linux instances
```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.amazon_ssm
      vars:
        allow_sudo: false
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use Docker and Virtualbox with Docker to run tests locally. You will have to install Virtualbox and Docker on your system. For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test default-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-7

# Apply ansible playbook
kitchen converge default-centos-7

# Apply inspec tests
kitchen verify default-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Linux
export KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test default-centos-7
```

### Testing on Windows with Virtualbox

Windows can only be test with Virtualbox provider,do not use 'kitchen test' command for testing Windows environment. There 4 steps you will be using with test-kitchen as part of your workflow.

First of all we must set the kitchen file:
```shell
# For testing Windows
export KITCHEN_YAML=.kitchen-windows.yml
```

Provision the virtual machines, a Linux machine to run Ansible and Windows machines to apply playbook again:
```shell
# deploy machines
kitchen create

# Launch playbook
kitchen converge
```

Finaly launch inspec tests:
```shell
kitchen verify
```

For cleaning environment use:
```shell
kitchen destroy
```

## License

Apache 2

## Author Information

This role was created in 2019 by diodonfrost.
