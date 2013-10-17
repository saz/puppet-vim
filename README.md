# puppet-vim

Manage vim via puppet and set it as default editor.

## Usage

```
    class { 'vim': }
```

## Class parameters
###* set_as_default
* Accepted values: true or false
* Default: true
* Description: Set VIM as default editor.

###* ensure 
* Accepted values: present or absent 
* Default: present
* Description: Whether or not VIM will be installed

###* autoupgrade 
* Accepted values: true or false
* Default: false
* Description: Whether or not the VIM package should be automatically kept up-to-date using the distribution's packaging system

###* set_editor_cmd
* Accepted values: string
* Default: update-alternatives --set editor /usr/bin/${editor_name} (Debian)
* Description: The command used to set VIM as the default editor. Be careful if you're setting this parameter.

###* test_editor_set 
* Accepted values: string
* Default: test /etc/alternatives/editor -ef /usr/bin/${editor_name} (Debian)
* Description: Command used to verify that VIM is the default editor. Be careful if you're setting this parameter.

###* conf_file
* Accepted values: string
* Default: /etc/vim/vimrc (Debian), /etc/vimrc (RedHat)
* Description: Path to VIM's main configuration file.

###* opt_bg_shading
* Accepted values: dark or light
* Default: dark
* Description: Terminal background colour. This affects the colour scheme used by VIM to do syntax highlighting.

###* opt_powersave
* Accepted values: true or false
* Default: true
* Description: If set to 'true' avoids cursor blinking that might wake up the processor.

###* opt_syntax
* Accepted values: true or false
* Default: true
* Description: Turns on syntax highlighting if supported by the terminal.

###* opt_misc
* Accepted values: array
* Default: ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden']
* Description: Array containing options that will be set on VIM.

