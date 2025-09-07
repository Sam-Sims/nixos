# nixos deployment

Deployed with colmena

```bash
# To get nix shell
nix flakes develop
# In nix shell run
colmena apply
```

Will apply config remote to hosts defined in ./hosts/*