#
# Cookbook Name:: node-ip
# Recipe:: default
#
# Copyright (C) 2013 Opsmatic
#

begin
	data = data_bag_item('nodes', node['hostname'])
rescue
	data = {}
end

service "networking" do
	provider Chef::Provider::Service::Init
	action :nothing
end

if data.has_key?('interfaces')
	template "/etc/network/interfaces" do
		source "interfaces.erb"
		notifies :restart, "service[networking]"
		variables({
			:data => data
		})
	end
else
	Chef::Log.warn("No 'nodes' databag detected for #{node['hostname']} or it does not have an 'interfaces' key, will skip static IP configuration")
end
