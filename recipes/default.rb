#
# Cookbook Name:: cluster
# Recipe:: default
#
# Copyright 2013, Blue Box Group, Inc.
#

package "corosync"

corosync_keys = Chef::EncryptedDataBagItem.load("keys", "corosync")

template "/etc/corosync/authkey" do
  source "blank.erb"
  owner 0
  group 0
  mode 00400
  variables :file_content => Base64.decode64(corosync_keys['authkey'])
end

template "/etc/corosync/corosync.conf" do
  source "corosync.conf.erb"
end

case node['platform']
when 'ubuntu'
  # thanks, I really wanted to edit a file to make the init script usable
  cookbook_file '/etc/default/corosync' do
    source 'etc-default'
    owner 'root'
    mode 00644
  end
end

service "corosync" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end