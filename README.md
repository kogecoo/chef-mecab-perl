mecab-perl Chef Cookbook
=======================

[![Circle CI](https://circleci.com/gh/kogecoo/chef-mecab-perl.svg?style=svg)](https://circleci.com/gh/kogecoo/chef-mecab-perl)

Installs an official perl binding for mecab

Platforms
---------
The following platforms and versions are tested and supported using test-kitchen

* Ubuntu 14.04
* Debian 7.8
* CentOS 7.0

Attributes
-----
see [source](attributes/default.rb)

Usage
-----
Just include `mecab-perl` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mecab-perl]"
  ]
}
```

Misc
----
[GitHub Repository](http://github.com/kogecoo/chef-mecab-perl)

License and Author
-------------------
- Author: [kogecoo](http://github.com/kogecoo)
- License: Apache License, Version 2.0 (see [LICENSE](LICENSE))
