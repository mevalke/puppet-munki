class munki::firewall {
  firewall_multi {'10 allow munki_server samba access':
    dport  => [ 137, 138, 139, 445 ],
    proto  => tcp,
    source => $munki_server::params::munkiserver_autopkg,
    action => accept,
  }        
  firewall_multi {'11 allow munki_server https access':
    dport  => [ 443 ],
    proto  => tcp,
    source => $munki_server::params::munkiserver_https,
    action => accept,
  }
} 
