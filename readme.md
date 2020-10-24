# rust playlist generator

## getting started

```bash
# will install all required dependencies and then drop you in a nix shell with
# all required dependencies
> ./bootstrap

# from launched nix shell
[nix-shell:/path/to/this/repo]$ cargo run
```

## thanks

Nix infrastructure taken from [How I Start Nix by Christine Dodrill](https://christine.website/blog/how-i-start-nix-2020-03-08)

> only difference is swapping in [`nix-direnv`](https://github.com/nix-community/nix-direnv) instead of `lorri`
