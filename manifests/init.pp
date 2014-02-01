# Class: vim
#
# This module manages vim and set it as default editor.
#
# Parameters:
#   [*set_as_default*]
#     Set editor as default editor.
#     Default: true
#
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*package*]
#     Name of the package.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*set_editor_cmd*]
#     Command to set editor as default editor.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*test_editor_set*]
#     Command to check, if editor is set as default.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*conf_file*]
#     VIM's main configuration file.
#     Default: /etc/vim/vimrc (Debian), /etc/vimrc (RedHat)
#
#   [*opt_bg_shading*]
#     Terminal background colour. This affects the colour scheme used by VIM to do syntax highlighting.
#     Valid values are either 'dark' or 'light'.
#     Default: dark
#
#   [*opt_powersave*]
#     If set to 'true' avoids cursor blinking that might wake up the processor.
#     Default: true
#
#   [*opt_syntax*]
#     Turns on syntax highlighting if supported by the terminal.
#     Default: true
#
#   [*opt_misc*]
#     Array containing options that will be set on VIM.
#     Default: ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden']
#
# Actions:
#   Installs vim and, if enabled, set it as default editor.
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'vim': }
#
# [Remember: No empty lines between comments and class definition]
class vim(
  $set_as_default   = $vim::params::set_as_default,
  $ensure           = 'present',
  $autoupgrade      = false,
  $package          = $vim::params::package,
  $set_editor_cmd   = $vim::params::set_editor_cmd,
  $test_editor_set  = $vim::params::test_editor_set,
  $conf_file        = $vim::params::conf,
  $opt_bg_shading   = $vim::params::background,
  $opt_powersave    = $vim::params::powersave,
  $opt_syntax       = $vim::params::syntax,
  $opt_misc         = $vim::params::misc,
) inherits vim::params {

  case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
      $file_ensure = 'file'
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $file_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  package { $package:
    ensure => $package_ensure,
  }

  file { $conf_file:
    ensure  => $file_ensure,
    content => template('vim/vimrc.erb'),
  }

  if $set_as_default {
    exec { $set_editor_cmd:
      path    => '/usr/bin:/usr/sbin',
      unless  => $test_editor_set,
      require => Package[$package],
    }
  }
}
