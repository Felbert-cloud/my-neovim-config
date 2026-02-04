-- Exit insert mode using jk or kj
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })

-- Exit terminal mode using jk or kj
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
vim.keymap.set('t', 'kj', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- Quit Neovim with <leader>q
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit Neovim' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save Neovim' })
vim.keymap.set('n', '<leader>e', '<cmd>Explore<CR>', { desc = 'Open File' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    local opts = { buffer = true, silent = true, noremap = true }

    -- Open file / enter directory
    vim.keymap.set('n', 'l', '<Plug>NetrwLocalBrowseCheck', opts)

    -- Go up one directory
    vim.keymap.set('n', 'h', '<Plug>NetrwBrowseUpDir', opts)
  end,
})

vim.keymap.set('n', '<leader>oo', function()
  require('opencode').toggle()
end, { desc = 'Open opencode' })

-- Create / open notes
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'New note' })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search notes' })

-- Daily notes
vim.keymap.set('n', '<leader>od', '<cmd>ObsidianToday<CR>', { desc = 'Today note' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTomorrow<CR>', { desc = 'Tomorrow note' })
vim.keymap.set('n', '<leader>oy', '<cmd>ObsidianYesterday<CR>', { desc = 'Yesterday note' })
