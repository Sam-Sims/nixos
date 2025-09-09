# nixos deployment

Deployed with colmena

```bash
# To get nix shell
nix develop
# In nix shell run
colmena apply
```

This will apply config remote to hosts defined in ./hosts/*

## Hosts

Hosts are primarliy nixos LXC containers deployed via proxmox.

## Organisation

### Flake.nix
Colmena is defined and managed in the flake.nix. Here a config is built and deployed for each entry in the `./hosts` folder.

### Hosts
The host entry contains deployment information (hostname etc) for colmena, and system specific config (i.e proxmox specific config options) as well as importing any user(s).

### Users
A user has packages managed by homemanager and can be imported by a host. The user config contains ssh keys and defines the packages installed for that user (importing from `./dots` for packages with any custom config).

### Dots
Dots contains any packages with custom config (primarliy managed by homemanager or by copying configs in xdg config dir in more complex cases)

### Modules
This contains any systemd services to be imported and run in a host.