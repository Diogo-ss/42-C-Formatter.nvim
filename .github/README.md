<h1 align="center">🛸 42 C Formatter</h1>

## ✨ Features
- use `CFormat42` to format current buffer

## ⚡ Requirements
  - Neovim 0.5+
  - [C Formatter 42](https://github.com/dawnbeen/c_formatter_42) package

## 🎈 Setup

### 📦 Packer.nvim
```lua
use { "Diogo-ss/42-C-Formatter.nvim" }
```

### 💤 Lazy.nvim
```lua
{ "Diogo-ss/42-C-Formatter.nvim" }
```
```lua
{
  "Diogo-ss/42-C-Formatter.nvim",
  cmd = "CFormat42",
  config = function()
    local formatter = require "42-formatter"
    formatter.setup({
      formatter = 'c_formatter_42',
      filetypes = { c = true, h = true, cpp = true, hpp = true },
    })
  end
}
```

### 🔌 Vim-plug 
```lua
call plug#begin()
  Plug 'Diogo-ss/42-C-Formatter.nvim'
call plug#end()
```

## ⚙ Options
```lua
{
  formatter = 'c_formatter_42',  -- The formatter to be used (e.g., 'c_formatter_42')
  filetypes = {
    c = true,     -- C files
    h = true,     -- C header files
    cpp = true,   -- C++ files
    hpp = true    -- C++ header files
    -- Add more file extensions here and set them to true as needed.
  }
}
```

## 🎨 Quick format
- Format on save:
```lua
local formatgrp = vim.api.nvim_create_augroup("C_format_42", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "CFormat42",
  group = formatgrp,
})
```
- Format using keybindings:
```lua
vim.api.nvim_set_keymap('n', '<F2>', ':CFormat42<CR>', { noremap = true, silent = true })
```
