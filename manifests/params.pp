class vim::params {
  $background = 'dark'
  $powersave  = true
  $syntax     = true
  $misc       = ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden']
  case $::osfamily {
    debian: {
      $package         = 'vim-nox'
      $editor_name     = 'vim.nox'
      $set_as_default  = true
      $set_editor_cmd  = "update-alternatives --set editor /usr/bin/${editor_name}"
      $test_editor_set = "test /etc/alternatives/editor -ef /usr/bin/${editor_name}"
      $conf            = '/etc/vim/vimrc'
    }
    redhat: {
      $package        = 'vim-enhanced'
      $set_as_default = false
      $conf           = '/etc/vimrc'
    }
    freebsd: {
      $package        = 'vim-lite'
      $set_as_default = false
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
