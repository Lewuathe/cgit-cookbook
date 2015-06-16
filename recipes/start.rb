#
# Cookbook Name:: cgit-cookbook
# Recipe:: default
#
# Copyright 2015, Kai Sasaki
#
# MIT License



template "/etc/apache2/conf-available/cgit.conf" do
  source "cgit_httpd.conf.erb"
  mode '0440'
  owner 'root'
  group 'root'
  variables(
    'ip_address' => node[:ipaddress]
  )
end

template "/etc/apache2/envvars" do
  source "envvars.erb"
  mode '0440'
  owner 'root'
  group 'root'
end

execute "a2enconf" do
  user "root"
  command "a2enconf cgit"
end

service "apache2" do
  action :start
end


