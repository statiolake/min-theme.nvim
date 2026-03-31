# min-theme.nvim

`min-theme.nvim` is a Neovim port of [miguelsolorio/min-theme](https://github.com/miguelsolorio/min-theme), with both upstream variants:

- `min` (auto switch by `:set background=dark|light`)
- `min-dark`
- `min-light`

Tree-sitter highlight captures are supported out of the box.
`min-dark` / `min-light` are fixed variants, while `min` tracks `background`.

## Install

Example with `lazy.nvim`:

```lua
{
  "statiolake/min-theme.nvim",
  priority = 1000,
}
```

## Usage

```lua
vim.o.background = "dark"
vim.cmd.colorscheme("min") -- loads min-dark

vim.o.background = "light"
vim.cmd.colorscheme("min") -- loads min-light
-- after loading "min", changing :set background=... auto-switches too
```

Optional configuration:

```lua
require("min_theme").setup({
  style = "min", -- "min" | "min-dark" | "min-light"
})
```

## Plugin Support

Common groups are themed for:

- `copilot.vim` (`CopilotSuggestion`)
- LSP / diagnostics (`Lsp*`, `Diagnostic*`)
- `blink.cmp` (`BlinkCmp*`)
- `snacks.nvim` (`SnacksPicker*`, `SnacksInput*`, `SnacksNotifier*`, `SnacksIndent*`, `SnacksDashboard*`)
- `nvim-cmp`
- `telescope.nvim` (legacy compatibility)
- `nvim-tree.lua` / `neo-tree.nvim`
- `which-key.nvim`
- `trouble.nvim`
- `ibl` / `indent-blankline.nvim`

## License

MIT. This repository keeps the upstream license and adds `statiolake` for the Neovim port.
