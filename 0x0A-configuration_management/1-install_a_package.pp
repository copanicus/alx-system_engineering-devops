# install puppet-lint -v 2.1.0

package { 'puppet-lint':
  ensure   => '2.1.0',
  provider => 'gem'
}
