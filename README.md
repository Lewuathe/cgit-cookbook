cgit cookbook
======================

This cookbook makes cgit hosting service in your server.
* Configuration of cgit service.
* Launch apache httpd for hosting cgit service.

Requirements
------------

#### packages
- `git` - cgit-cookbook needs git cookbook.
- `apt` - For ubuntu environment, cgit-cookbook needs apt.

Attributes
----------

#### cgit-cookbook::default
|Key|Type|Description|Default|
|:---|:---|:---|:---|
|['cgit']['private_ip']|string|Used in apache configuration|192.168.33.34|
|['cgit']['version']|string|cgit version|0.10.2|
|['cgit']['package_name']|string|Package name which is compressed in tar format.|cgit-#{node['cgit']['version']}.tar.xz|
|['cgit']['package_url']|string|The url from which package is downloaded.|http://git.zx2c4.com/cgit/snapshot/#{node['cgit']['package_name']}|
|['cgit']['project_list']|string|The file which lists up projects hosted by cgit.|/home/git/projects.list|
|['cgit']['scan_path']|string|The directory which includes all repositories hosted by cgit.|/home/git/repositories|

Usage
-----
#### cgit-cookbook::default
TODO: Write usage instructions for each cookbook.

Just include `cgit-cookbook` in your node's `run_list`.
In order to launch apache httpd, you should also write `cgit::start` recipe.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cgit]",
    "recipe[cgit::start]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

[MIT License](http://opensource.org/licenses/MIT)

Authors: Kai Sasaki([@Lewuathe](https://github.com/Lewuathe))
