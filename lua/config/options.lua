vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- nvim-tree toggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })


vim.keymap.set('n', '<leader>t<Right>', ':vert rightbelow 50vsplit | terminal<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>t<Down>', ':botright 10split | terminal<CR>', { noremap = true, silent = true })

-- window navigatio
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to down window" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to up window" })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

-- bufferline
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<A-Left>', '<Cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<A-c>', function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd('bp | bd #')
  else
    vim.cmd('bd')
    vim.cmd('NvimTreeFocus')
  end
end)

-- definition
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.definition, { desc = 'Go to definition' })

-- move lines up and down with alt and arrow
vim.keymap.set('n', '<A-Down>', '<Cmd>m .+1<CR>')
vim.keymap.set('n', '<A-Up>', '<Cmd>m .-2<CR>')
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv")
