local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
-- map leader of easymotion to <Leader>e, the default is <Leader><Leader>, 
-- which is conflict with Telescope find_files
keymap("n", "<Leader>]", "<Plug>(easymotion-prefix)", opts)

keymap("n", "<Leader>tu", ":UndotreeToggle<cr>", {})

keymap("i", "<C-g>", "<ESC>", opts)
keymap("c", "<C-g>", "<ESC>", opts)
keymap("t", "<C-g>", "<ESC>", opts)

-- Normal --
keymap("n", "<leader>0", ":close<cr>", opts)
keymap("n", "<leader>1", "<C-w>o<cr>", opts)
keymap("n", "<leader>2", ":vs<cr>", opts)
keymap("n", "<leader>3", ":sp<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- tab navigation
keymap("n", "<leader>tn", ":tabnew<CR>", {})
keymap("n", "<leader>tt", ":tabNext<CR>", {})
keymap("n", "<leader>tp", ":tabprevious<CR>", {})
keymap("n", "<leader>tc", ":tabclose<CR>", {})


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

keymap("i", "<c-f>", "<right>", opts)
keymap("i", "<c-b>", "<left>", opts)
keymap("i", "<c-e>", "<end>", opts)
keymap("i", "<c-a>", "<home>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
--[[ keymap("v", "<A-j>", ":m .+1<CR>==", opts) ]]
--[[ keymap("v", "<A-k>", ":m .-2<CR>==", opts) ]]
--[[ keymap("v", "p", '"_dP', opts) ]]

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


keymap("n", "<Leader>pp", ":Telescope projects<CR>", opts)
keymap("n", "<Leader><Leader>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-g>", ":<ESC>:noh<CR>", opts)

-- open config path
keymap("n", "<Leader>fp", ":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim/' })<CR>", {})

keymap("v", "<Leader>*", ":Telescope grep_string<CR>", {})
keymap("n", "<Leader>*", ":Telescope grep_string<CR>", {})

keymap("n", "gl", "$", {}) -- goto line end 
keymap("n", "gh", "0", {}) -- goto line start
keymap("n", ",", ":HopWord<CR>", {})

keymap("n", "<Leader>sh", ":split<CR>", {})
keymap("n", "<Leader>sv", ":vs<CR>", {})

keymap("n", "<Leader>,", ":lua require('telescope.builtin').buffers({ sort_mru = true })<cr>", {})

keymap(
  "n",
  "<leader>.",
  ":lua require('telescope').extensions.file_browser.file_browser({cwd = vim.fn.expand('%:p:h')})<CR>",
  {}
)
keymap("n", "<Leader>sp", ":Telescope live_grep<CR>", {})

-- System clipboard integration
-- https://github.com/neovide/neovide/issues/113
-- <D- stands for command or super key. help <D-
keymap("n", "<D-v>", '"+p', {})
keymap("i", "<D-v>", "<C-r>+", {})

keymap("n", "<leader>gg", ":G<cr>", opts)
-- close current buffer
keymap("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<cr>", opts)
keymap("n", "<leader>ss", ":Telescope current_buffer_fuzzy_find<cr>", opts)

keymap("n", "<Leader><cr>", ":Telescope commands<cr>", opts)
keymap("n", "<Leader>n", ":NvimTreeToggle<cr>", opts)

-- keymap
-- keymap('n', "/", "<Plug>(easymotion-sn)", opts)

-- todo
keymap("n", "<Leader>vp", ":VimuxPromptCommand<CR>", opts)
keymap("n", "<Leader>vl", ":VimuxRunLastCommand<CR>", opts)
keymap("n", "<Leader>vq", ":VimuxCloseRunner<CR>", opts)

-- quit
keymap('n', "<Leader>zz", ':qa!<CR>', opts)

-- file outline
keymap('n', "<Leader>si", ':Telescope aerial<CR>', opts)

-- format json
keymap("n", "<Leader>bjj", ":%!python3 -m json.tool<CR> :set filetype=json<CR>", opts)
keymap("n", "<Leader>bN", ":tabnew<CR>", opts)
