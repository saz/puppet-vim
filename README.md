# puppet-vim

Manage vim via puppet and set it as default editor

## Usage

```
    class { 'vim': }
```

## Other class parameters
* set_as_default: true or false, default: true.
* ensure: present or absent, default: present.
* autoupgrade: true or false, default: false. 
* set_editor_cmd: string, default: OS specific. Set set_editor_cmd, if platform is not supported.
* test_editor_set: string, default: OS specific. Set test_editor_set, if platform is not supported.
