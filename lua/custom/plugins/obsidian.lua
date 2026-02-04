return {
  'epwalsh/obsidian.nvim',
  version = '*', -- latest stable release
  lazy = true,
  -- Load if we open a markdown file, OR run a command, OR use a keymap
  ft = 'markdown',
  cmd = {
    'ObsidianNew',
    'ObsidianSearch',
    'ObsidianQuickSwitch',
    'ObsidianToday',
    'ObsidianBacklinks',
    'ObsidianLinks',
    'ObsidianTemplate',
  },
  keys = {
    { '<leader>on', '<cmd>ObsidianNew<cr>', desc = '[O]bsidian [N]ew Note' },
    { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = '[O]bsidian [S]earch' },
    { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = '[O]bsidian [Q]uick Switch' },
    { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = '[O]bsidian [T]oday' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = '[O]bsidian [B]acklinks' },
    { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = '[O]bsidian [L]inks' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/vault',
      },
    },

    -- Optional, set to true to force 'obsidian.nvim' to always use the absolute path
    -- for links.
    use_absolute_path = false,

    -- Optional, configure key mappings. These are the defaults. If you don't want them, set mappings = {}
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/obsidian links
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link, or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    -- Disable UI features to avoid conceallevel warning
    ui = {
      enable = false,
    },
  },
}
