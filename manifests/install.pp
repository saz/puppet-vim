class vim::install {
    package { $vim::params::package_name:
        ensure => present,
    }
}
