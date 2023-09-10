# Vim Saver plugin

**Yet another auto-save plugin for Neovim.**
Saves your work automatically after a short delay or as soon as you exit insert
mode, making sure you never lose unsaved changes.

Maintained by [Florin Ciurcanu](https://github.com/kopsha).


## Features
- **Delay Auto-Save**: Adds a delay before auto-saving, reducing the number of
  save operations if you type quickly.
- **Excluded File Types**: Some file types, like `netrw` or `startify`, don't
  need auto-saving. Vim Saver knows this and skips auto-saving for these types.
- **Dimmed notification message**: after a while you may be annoyed by the
  autosave notification, so it is dimmed. Maybe it worths to be configurable.
- **Customizable**: Want to adjust the delay or exclude additional file types?
  Vim Saver's got you covered!


## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'kopsha/vim-saver',
    tag = '1.*',  -- to avoid annoying unreleased updates
    config = function()
        require 'vim-saver'.setup({
            hold_for_ms = 1250,  -- adjust delay as desired
            -- add or remove excluded file types as needed
            excluded_filetypes = { netrw = true, startify = true, ... },
        })
    end
}
```


## Usage

Once installed, Vim Saver will automatically save any changes you make:

After leaving insert mode.
Upon any text changes, but with the delay you've specified.


## Configuration

You can customize Vim Saver by passing a table to the setup function:


### `hold_for_ms`

Determines the delay (in milliseconds) before auto-saving after a text change.
- Type: number
- Default: 1250

### `excluded_filetypes`

A list of file types for which auto-saving should be skipped.
- Type: table
- Default:
  ```
    excluded_filetypes = {
        netrw           = true,
        startify        = true,
        NvimTree        = true,
        fugitive        = true,
        fugitiveblame   = true,
        gitcommit       = true,
        qf              = true,
        help            = true,
        undotree        = true,
        vista           = true,
        packer          = true,
        TelescopePrompt = true,
    }
  ```


## Contributing

Feel free to open an issue or pull request if you find any bugs or have
suggestions for improvements.


## License

Vim Saver is licensed under the GNU General Public License v3.0. See
[LICENSE](./LICENSE) for more information.

