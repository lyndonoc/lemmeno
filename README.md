# lemmeno

A Zsh plugin for macOS that says your command is complete when it finishes — perfect for developers who get sidetracked while waiting for tests, builds, or other lengthy tasks.

## Features

- ⏱ Tracks how long each command takes
- ⚙️ Configurable threshold via environment variable
- 🪄 Only shows output for long-running commands
- 🧪 Supports concurrent sessions (e.g. multiple tabs/panes)

## Installation

1. Clone this repository into `$HOME/.zsh/plugins`

   ```sh
   # HTTPS
   git clone https://github.com/lyndonoc/lemmeno $HOME/.zsh/plugins/lemmeno
   # SSH
   git clone git@github.com:lyndonoc/lemmeno.git $HOME/.zsh/plugins/lemmeno
   ```

2. Source the plugin in `.zshrc`

   ```sh
   echo "source \$HOME/.zsh/plugins/lemmeno/lemmeno.sh" >> $HOME/.zshrc
   ```

3. Reload your zsh

   ```sh
   source $HOME/.zshrc
   ```

## Configuration

You can control when the plugin is activated by setting the `ZSH_COMMAND_TIMER_THRESHOLD` environment variable.

- Set it in your `.zshrc` like this:
  ```sh
  export ZSH_COMMAND_TIMER_THRESHOLD=1.5
  ```
- This means only commands that take longer than 1.5 seconds will trigger this plugin.
- If you don't set this variable, it defaults to 5 seconds.
