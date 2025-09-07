# nixos deployment

Deployed with colmena

```bash
# To get nix shell
nix flakes develop
# In nix shell run
colmena apply
```

This will apply config remote to hosts defined in ./hosts/*

## Hosts

Hosts are primarliy nixos LXC containers deployed via proxmox.