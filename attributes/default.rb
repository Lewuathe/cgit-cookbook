default['cgit']['private_ip'] = "192.168.33.34"

default['cgit']['version'] = '0.10.2'
default['cgit']['package_name'] = "cgit-#{node['cgit']['version']}.tar.xz"
default['cgit']['package_url'] = "http://git.zx2c4.com/cgit/snapshot/#{node['cgit']['package_name']}"

default['cgit']['project_list'] = '/home/git/projects.list'
default['cgit']['scan_path'] = '/home/git/repositories'
