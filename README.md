# wezterm config

[Wezterm](https://wezfurlong.org/wezterm/index.html) config tht replicates what I was used to do with tmux. This configuration goes together with the [neovim config](https://github.com/Spronghi/nvim-config).

## Why Wezterm over tmux?

The only functionality I was using from tmux was actually the tab and pan management, no sessions or stuff like that. Becuse of that I've decided to remove one tool to have less configurations, since wezterm is really easy to personalise based on your need, both for WSL and MacOS.

## Configuration

The configuration is a mix between tmux and Mac shortcuts.

TODO list of shortcuts

## Other dependencies

These depencies are not necessary, but they improve the user experience :D
 - [oh-my-zsh](https://ohmyz.sh/#install)
 - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file)
 - [Starship](https://starship.rs/).
 - [fzf](https://github.com/junegunn/fzf)
 - [zoxide](https://github.com/ajeetdsouza/zoxide)

## zsh

As zsh config just add something like this at the end

``` config
# ~/.config/.zshrc
...
ZSH_THEME="simple"
...
plugins=(
  git
  zsh-autosuggestions
)
...
# Starship start
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
```

Just to enable `starship` and `zoxide` with the theme `simple`.

## Starship

The config here is also very simple

```
# ~/.config/starship.toml

command_timeout = 2000
add_newline = false

[directory]
truncate_to_repo = false
truncation_length = 3
truncation_symbol = ".../"
```

## Things I want to try

These are dependencies I'd like to try but I never had the time to
 - [warp](https://www.warp.dev/)

## Fonts

My favorite font is [Cascadia Mono](https://github.com/microsoft/cascadia-code).
