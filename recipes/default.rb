#
# Cookbook Name:: node-ip
# Recipe:: default
#
# Copyright (C) 2013 Opsmatic
# 
# All rights reserved - Do Not Redistribute
#

begin
	data = data_bag_item('nodes', node['hostname'])
rescue
	data = {}
end

service "networking" do
	action :nothing
end

template "/etc/network/interfaces" do
	source "interfaces.erb"
	notifies :restart, "service[networking]"
	variables({
		:data => data
	})
end

