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
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cgit']['private_ip']</tt></td>
    <td>string</td>
    <td>Used in apache configuration</td>
    <td><tt>192.168.33.34</tt></td>
  </tr>
  <tr>
  <td><tt>['cgit']['version']</tt></td>
  <td>string</td>
  <td>cgit version</td>
  <td><tt>0.10.2</tt></td>
  </tr>
  <tr>
    <td><tt>['cgit']['package_name']</tt></td>
    <td>string</td>
    <td>Package name which is compressed in tar format.</td>
    <td><tt>cgit-#{node['cgit']['version']}.tar.xz</tt></td>
  </tr>
  <tr>
    <td><tt>['cgit']['package_url']</tt></td>
    <td>string</td>
    <td>The url from which package is downloaded</td>
    <td><tt>http://git.zx2c4.com/cgit/snapshot/#{node['cgit']['package_name']}</tt></td>
  </tr>
  <tr>
    <td><tt>['cgit']['project_list']</tt></td>
    <td>string</td>
    <td>The file which lists up projects hosted by cgit</td>
    <td><tt>/home/git/projects.list</tt></td>
  </tr>
  <tr>
    <td><tt>['cgit']['scan_path']</tt></td>
    <td>string</td>
    <td>The directory which includes all repositories hosted by cgit</td>
    <td><tt>/home/git/repositories</tt></td>
  </tr>
</table>

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
