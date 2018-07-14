class munki::web_server {
  apache::vhost {"$::fqdn":
    port              => '443',
    docroot           => $munki::docroot,
    default_vhost     => true,
    ssl               => true,
    ssl_verify_client => require,
    ssl_verify_depth  => 1,
    ssl_ca            => "/etc/puppetlabs/puppet/ssl/certs/ca.pem",
    ssl_cert          => "/etc/puppetlabs/puppet/ssl/certs/$::fqdn.pem",
    ssl_key           => "/etc/puppetlabs/puppet/ssl/private_keys/$::fqdn.pem",
  }
}
