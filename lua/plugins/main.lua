return {
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript" }, -- languages
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          lua = { "stylua" },
          python = { "black", "isort" }
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
        python = { "pylint" }
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
      vim.diagnostic.config({
        virtual_text = false, -- Disable inline text that goes off-screen
        signs = true,
        severity_sort = true,
        float = {
          source = 'always',
          border = 'rounded',
          focusable = false,
          max_width = 80, -- Prevents float from going off-screen
          header = '',
          prefix = '',
        },
        update_in_insert = false,
      })

      -- Keymap to show diagnostic float
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic details' })

      vim.keymap.set('n', '<leader>c', function()
        local diag = vim.diagnostic.get_next() or vim.diagnostic.get_prev()
        if diag and diag.message then
          vim.fn.setreg('+', diag.message) -- Copy to system clipboard
          print("Copied diagnostic message to clipboard")
        end
      end, { desc = "Copy diagnostic message" })
    end
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left"
            }
          }
        }
      })
    end,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
            or (e == "warning" and " " or " ")
        s = s .. n .. sym
      end
      return s
    end
  },
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      alpha.setup(dashboard.config)
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup({})
      require('nvim-autopairs').enable()
    end,
  },
  {
    'abecodes/tabout.nvim',
    config = true,
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        terminal_mappings = true,
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup()
    end
  }
}
