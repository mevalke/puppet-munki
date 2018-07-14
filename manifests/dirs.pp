class munki::dirs {
  $repositories = $munki::repositories
  $docroot      = $munki::docroot
  
  File {
    owner	=> $munki::sambauser,
    group	=> $munki::sambauser,
    mode	=> '0777',
    recurse	=> true,
  }
  
  file { $docroot/munki: ensure => directory }
  
  $repositories.each |$locale| {
    file { $docroot/munki/$locale: ensure => directory }
    file { $docroot/munki/$locale/pkgs: ensure => directory }
    file { $docroot/munki/$locale/pkgsinfo: ensure => directory }
    file { $docroot/munki/$locale/manifests: ensure => directory }
    file { $docroot/munki/$locale/catalogs: ensure => directory }
    file { $docroot/munki/$locale/icons: ensure => directory }
  }
}
