return {
	"romgrk/barbar.nvim",
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	init = function() vim.g.barbar_auto_setup = true end,
	opts = {
	},
	version = '^1.0.0',
	config = function ()
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		
		-- Move to previous/next
		map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
		map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

		-- Re-order to previous/next
		map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
		map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

		-- Pin/unpin buffer
		map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
		-- Close buffer
		map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

		-- Magic buffer-picking mode
		map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
	end
}
