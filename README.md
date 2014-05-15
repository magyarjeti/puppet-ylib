# Yeti Standard Library

[![Build Status](https://travis-ci.org/magyarjeti/puppet-ylib.svg?branch=master)](https://travis-ci.org/magyarjeti/puppet-ylib)

This module contains some functions missed from Puppet Labs Standard Library.

## Functions

smooth
------
This function flatten any deeply nested hash to one dimensional.

*Example*

    smooth({"foo" => 1, "bar" => {"baz" => "qux"}})

Would result in:

    {"foo" => 1, "bar.baz" => "qux"}

Please log tickets and issues at our [project site](https://github.com/magyarjeti/puppet-ylib)
