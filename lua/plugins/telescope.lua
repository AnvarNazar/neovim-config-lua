return {
	"nvim-telescope/telescope.nvim",
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-dap.nvim" },
	config = function ()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		require('telescope').load_extension('dap')
	end
}
