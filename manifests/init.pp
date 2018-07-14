# Class: munki
# ===========================
#
# Full description of class munki here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'munki':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Miikka Valkeapää
#
# Copyright
# ---------
#
# Copyright 2018 Miikka Valkeapää, unless otherwise noted.
#
class munki {
  $munkiserver = lookup(munki::server)
  $munkiclient = lookup(munki::client)

  if $munkiserver == true {
    $sambauser        = lookup(munki::sambauser)
    $sambapassword    = lookup(munki::sambapassword)
    $repositories     = lookup(munki::repositories)
    $samba_interfaces = lookup(munki::samba_interfaces)
    $docroot          = "/usr/local/html"
    
    include stdlib
    include defines
    include firewall_linux
    include munki::dirs
    include munki::share
    include munki::web_server
    include munki::firewall
  }

  if $munkiclient == true {
    $munkitools 		= lookup(munki::munkitools)
    $appleupdatesonly		= lookup(munki::appleupdatesonly)
    $installappleupdates	= lookup(munki::installappleupdates)
    $munkirepo 			= lookup(munki::munkirepo)

    include munki::client
  }
}
