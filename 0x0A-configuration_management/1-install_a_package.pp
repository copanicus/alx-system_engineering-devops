#!/bin/usr/pup
# Using Puppet, install flask from pip3 -v 2.1.0

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3'
}
