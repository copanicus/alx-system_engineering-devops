# Installs a Nginx server

exec {'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https://www.youtube.com permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start',
}

# define the package to install
package { 'nginx':
  ensure => installed,
}

#write 'Hello World!' to the index.html file 
file { '/var/www/html/index.html':
  content => Hello World!,
}

# Configure Nginx to listen on port 80 and perform a redirect
class { 'nginx':
  default_site_enabled => true,
}

nginx::resource::vhost { 'default':
  listen_port => '80',
  proxy       => false,
  rewrite     => [
    '^/redirect_me https://www.youtube.com permanent',
  ],
}

# Start Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
}
