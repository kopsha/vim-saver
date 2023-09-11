# Vim Saver

> Yet another auto-save plugin, a true time saver.


## Introduction

**Vim Saver** is an auto-save plugin for Vim. It ensures that your buffers are
saved automatically as you work, minimizing the risk of data loss.


## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use { 'kopsha/vim-saver', tag = '1.*' }
```


## Commands

Toggles the auto-save functionality on and off.

```vim
:SaverToggle
```

## Configuration

By default, Vim Saver avoids certain file types to ensure system and plugin
buffers aren't unnecessarily saved. Customize the list of excluded filetypes
using the provided Lua API.


## Lua API

The Lua API offers the classical configuration options:

- `setup(params)`: Changes the default settings.
- `toggle()`: Programmatically toggle Vim Saver status.


For example, to exclude autosaving for `markdown` and `txt` files:

```lua
lua require'vim-saver'.setup({
    excluded_filetypes = {
        markdown = true,
        txt      = true
    }
})
```

## Contributing

Feel free to open an issue or pull request if you find any bugs or have
suggestions for improvements.


## License

Vim Saver is licensed under the GNU General Public License v3.0. See
[LICENSE](./LICENSE) for more information.

