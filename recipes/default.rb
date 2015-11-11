#
# Cookbook Name:: cgit-cookbook
# Recipe:: default
#
# Copyright 2015, Kai Sasaki
#
# MIT License

include_recipe 'apache2'
include_recipe 'git'

cgit_version = node['cgit']['version']
cgit_package_name = node['cgit']['package_name']
cgit_package_url = node['cgit']['package_url']

## Resolv dependencies

package "apache2" do
  action :install
end

user "apache" do
  home "/home/apache"
  comment "Apache httpd daemon user"
end

user "git" do
  home "/home/git"
  comment "Git repository management user"
end

package "curl" do
  action :install
end

package "gcc" do
  action :install
end


remote_file "/tmp/#{cgit_package_name}" do
  source cgit_package_url
end

execute "tar cgit package" do
  cwd "/tmp"
  command "tar Jxvf /tmp/#{cgit_package_name}"
end

execute "compile cgit" do
  cwd "/tmp/cgit-#{cgit_version}"
  command "make get-git"
end

template "/tmp/cgit-#{cgit_version}/cgit.conf" do
  source "cgit.conf.erb"
end

execute "make" do
  cwd "/tmp/cgit-#{cgit_version}/"
end

execute "make install" do
  cwd "/tmp/cgit-#{cgit_version}"
end

template "/etc/cgitrc" do
  source "cgitrc.erb"
  mode '0666'
  owner 'root'
  group 'root'
  variables(
    'project_list' => node['cgit']['project_list'],
    'scan_path' => node['cgit']['scan_path']
  )
end
