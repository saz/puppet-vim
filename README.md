# puppet-vim

Manage vim via puppet and set it as default editor.

## Usage

```
    class { 'vim': }
```

## Class parameters
* set_as_default: true or false, default: true.
  Set editor as default editor.
* ensure: present or absent, default: present.
* autoupgrade: true or false, default: false. 
* set_editor_cmd: string, default: OS specific. Set set_editor_cmd, if platform is not supported.
* test_editor_set: string, default: OS specific. Set test_editor_set, if platform is not supported.
* conf_file: string, default: OS specific.
* opt_bg_shading: string, default: dark.
* opt_powersave: true or false, default: true.
* opt_syntax: true or false, default: true.
* opt_misc: array, default: ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden','tabstop=4']
