
# VimSaver 🕰️💾

> Fellow coder,
> Are you tired of hitting `:w` every minute or simply losing changes due to an
> unexpected crash?
> Let "VimSaver" have your back. I know it is *yet another auto-save plugin*,
> but this one has a cool twist.


## Installation 🛠️

1. Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

   ```lua
   use { 'kopsha/vim-saver', tag = '1.*' }
   ```


## Usage 🚀

Once you've got VimSaver installed, it's pretty much set and forget.
But, for the tinkerers:

Feeling like manually handling your saves for a while? No worries. Just type:
```vim
:SaverToggle
```
and you're in control again.


## Configuration ⚙️

VimSaver is pretty chill out of the box. But if you're a customization junkie,
here's how you can tweak it:

- **active**: Want VimSaver to be on its guard right from the start? Set this
  to `true` (default). Not in the mood? `false` it is.
- **debounce_ms**: How long should VimSaver wait before saving after an edit?
  Set your desired delay in milliseconds. Default's at a cool 2584ms (because
  why not?).

Example:
```lua
require("vim-saver").setup({
    active = true,
    debounce_ms = 3000,
})
```


## Behind the Scenes 🎬

Ever wondered what makes VimSaver tick? It's all about listening to your Vim's
vibes. When you make changes, or when you shift your focus, it decides whether
to jump in and save the day.

And hey, if you've got ideas or wanna see how the magic happens, dive into the
code. PRs and suggestions always welcome!


## Hats off 🎩

Got questions? Suggestions? Or just wanna chat about the latest Vim tricks?
Drop a line over at the [repo](https://github.com/kopsha/vim-saver/issues) or
ping directly. Cheers and happy coding!


## License

VimSaver is licensed under the GNU General Public License v3.0. See
[LICENSE](./LICENSE) for more information.

