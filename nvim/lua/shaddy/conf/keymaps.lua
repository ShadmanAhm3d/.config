local opts = { noremap = true, silent = true }

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

-- **Tabs**
--[[ keymap("n", "<S-Tab>", ":tabprevious<CR>", opts) -- Switch to the previous tab
keymap("n", "<Tab>", ":tabnext<CR>", opts) -- Switch to the next tab ]]
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", opts)

-- Navigate buffers
keymap("n", "<A-i>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
--CODE RUNNER
keymap("n", "<leader>r", ":vsplit | term g++ %:p && ./a.out<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>rp', ':vsplit | term python3 %<CR>', { noremap = true, silent = true })

--minimalist

keymap("n", "<leader>m", ":TZMinimalist<CR>", opts)

keymap("n", "<leader>ta", "<Cmd>CompetiTest add_testcase<CR>", opts)
keymap("n", "<leader>tr", "<Cmd>CompetiTest run<CR>", opts)

-- Nvimtresse
-- keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

--Bufferline

keymap("n", "<A-w>", ":bdelete<CR>", opts)

keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", ":w<CR>", opts)

--dap

keymap("n", "<leader>db", "<Cmd>DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>dr", "<Cmd>DapContinue<CR>", opts)
