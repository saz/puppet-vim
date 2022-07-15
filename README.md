# puppet-vim [![Puppet Forge](http://img.shields.io/puppetforge/v/saz/vim.svg)](https://forge.puppet.com/modules/saz/vim) [![CI](https://github.com/saz/puppet-vim/actions/workflows/ci.yml/badge.svg)](https://github.com/saz/puppet-vim/actions/workflows/ci.yml)

Manage VIM via puppet.

Vim is an advanced text editor that seeks to provide the power of the de-facto Unix editor 'Vi', with a more complete feature set.

This module aims to enable easy installation and configuration of VIM through class parameters on different platforms, in a way that the administrator can easily set it up differently according to need and/or personal taste.

## Usage

```puppet
    class { 'vim': }
```

## Class parameters

* `set_as_default` - Set VIM as default editor (default: `true`).
* `ensure` - Whether or not VIM will be installed (default: `present`).
* `autoupgrade` - Whether or not the VIM package should be automatically kept up-to-date using the distribution's packaging system (default: `false`).
* `set_editor_cmd` - The command used to set VIM as the default editor. Be careful if you're setting this parameter (default: `update-alternatives --set editor /usr/bin/${editor_name}` for Debian)
* `test_editor_set` - Command used to verify that VIM is the default editor. Be careful if you're setting this parameter (default: `test /etc/alternatives/editor -ef /usr/bin/${editor_name` for Debian)
* `conf_file` - Path to VIM's main configuration file (default: `/etc/vim/vimrc` (Debian), `/etc/vimrc` (RedHat))
* `opt_nocompatible` - If `true`, `"set nocompatible"` is added to the top of the vimrc.
* `opt_backspace` - Set the behavior of the backspace key in insert mode (default: `2`).
* `opt_bg_shading` - Terminal background colour. This affects the colour scheme used by VIM to do syntax highlighting. Accepted values: dark or light (default: `dark`)
* `opt_indent` - If true, Vim loads indentation rules and plugins according to the detected filetype (default: `true`).
* `opt_lastposition` If `true`, Vim jumps to the last known position when reopening a file (default: `true`).
* `opt_matchparen` - If `true` and syntax is on, putting your cursor on a paren/brace/bracket will highlight its pair (default: `true`).
* `opt_powersave` - If set to 'true' avoids cursor blinking that might wake up the processor (default: `true`).
* `opt_ruler` - Turns on the ruler (default: `false`).
* `opt_syntax` - Turns on syntax highlighting if supported by the terminal (default: `false`).
* `opt_misc` - Array containing options that will be set on VIM. Anything contained here will show as a "set option" line in your vimrc (default: `['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden']`).
* `opt_maps` - Hash containing keybinds for use in "map <k> <v>" lines in your vimrc (default: `{}`).
* `opt_code` - Array containing custom lines in your vimrc (default: `[]`).

## Sample Usage
Install VIM and use the provided configuration defaults
```puppet
node default {
  class { 'vim': }
}
```
Turn on line numbering while keeping the default opt_misc values
```puppet
node default {
  class { 'vim':
    opt_misc => ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden','number'],
  }
}
```
Set F5 key to save and execute current file
```puppet
node default {
  class { 'vim':
    opt_maps => { '<F5>': '<Esc>:w<CR>:!%:p<CR>' },
  }
}
```
Uninstall vim
```puppet
node default {
  class { 'vim':
    ensure => absent,
  }
}
```

## Acknowlegments
This module was forked from the one originally written by Saz (https://github.com/saz/puppet-vim). It adds enterprise linux support and configuration file management, which were not present on the original at the time of the first release.
