class munki::share {
  $repositories     = $munki::repositories
  $docroot          = $munki::docroot
  $samba_interfaces = $munki::samba_interfaces
  $sambauser        = $munki::sambauser
  $sambapassword    = $munki::sambapassword
 
  class {'samba::server':
    workgroup     => 'workgroup',
    server_string => "Munki Server",
    interfaces    => $samba_interfaces,
    security      => 'user',
  }

  samba::server::user {'ladmin':
    password => $munki::sambapassword,
    name     => $munki::sambauser,
  }

  $repositories.each |$locale| {
    samba::server::share { $locale:
      comment     => 'Munkirepo share',
      path        => $docroot/munki/$locale,
      guest_ok    => false,
      browsable   => false,
      writable    => true,
      read_only   => false,
      public      => false,
      valid_users => $sambauser,
    }
  }
}
