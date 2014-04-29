# Puppet Labs Standard Library Extension

This is the ylib module. An extension of the original Puppet Labs stdlib.

## Functions

smooth
------
This function flatten any deeply nested hash to one dimensional.

*Example*

    smooth({"foo" => 1, "bar" => {"baz" => "qux"}})

Would result in:

    {"foo" => 1, "bar.baz" => "qux"}

Please log tickets and issues at our [Projects site](http://projects.example.com)
