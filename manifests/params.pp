class vim::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name = 'vim-nox'
            $editor_name = 'vim.nox'
        }
    }
}
