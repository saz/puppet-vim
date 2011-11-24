class vim::config {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            exec { "update-alternatives --set editor /usr/bin/${vim::params::editor_name}":
                unless  => "test /etc/alternatives/editor -ef /usr/bin/${vim::params::editor_name}",
                require => Class['vim::install'],
            }
        }
    }
}
