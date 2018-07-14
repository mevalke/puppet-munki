class munki::client {
  package { "munkitools":
    ensure   => installed,
    provider => pkgdmg,
    source   => $munki::munkitools
  }
  defines::defaults { 'AppleSoftwareUpdatesOnly':
    domain       => '/Library/Preferences/ManagedInstalls',
    key          => 'AppleSoftwareUpdatesOnly',
    type         => 'int',
    desiredstate => $munki::appleupdatesonly,
  }
  defines::defaults { 'ClientCertificatePath':
    domain       => '/Library/Preferences/ManagedInstalls',
    key          => 'ClientCertificatePath',
    type         => 'string',
    desiredstate => "/etc/puppetlabs/puppet/ssl/certs/${::clientcert}.pem",
  }
  defines::defaults { 'ClientKeyPath':
    domain       => '/Library/Preferences/ManagedInstalls',
    key          => 'ClientKeyPath',
    type         => 'string',
    desiredstate => "/etc/puppetlabs/puppet/ssl/private_keys/${::clientcert}.pem",
  }
  defines::defaults { 'InstallAppleSoftwareUpdates':
    domain       => '/Library/Preferences/ManagedInstalls',
    key          => 'InstallAppleSoftwareUpdates',
    type         => 'int',
    desiredstate => $munki::installappleupdates,
  }
  defines::defaults { 'SoftwareRepoURL':
    domain       => '/Library/Preferences/ManagedInstalls.plist',
    key          => 'SoftwareRepoURL',
    type         => 'string',
    desiredstate => $munki::munkirepo,
  }
  defines::defaults { 'SoftwareRepoCACertificate':
    domain       => '/Library/Preferences/ManagedInstalls.plist',
    key          => 'SoftwareRepoCACertificate',
    type         => 'string',
    desiredstate => "/etc/puppetlabs/puppet/ssl/certs/ca.pem" 
  }
  defines::defaults { 'UseClientCertificate':
    domain       => '/Library/Preferences/ManagedInstalls.plist',
    key          => 'UseClientCertificate',
    type         => 'int',
    desiredstate => 1,
  }
}
