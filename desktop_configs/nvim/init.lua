require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    priority = 1000,
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "bash" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      }
    end
  }
})

-- Force Tree-sitter highlighting after setup
vim.api.nvim_create_autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.bo[buf].filetype
    
    if ft ~= "" then
      vim.schedule(function()
        -- Check if treesitter parser exists for this filetype
        local has_parser = pcall(vim.treesitter.get_parser, buf, ft)
        if has_parser then
          vim.treesitter.start(buf, ft)
        end
      end)
    end
  end,
})

vim.cmd('colorscheme habamax')

