return {
	"neoclide/coc.nvim",
	branch = "release",
	config = function ()
		vim.keymap.set('n', '<leader>F', '<Cmd>CocCommand editor.action.formatDocument<CR>');
	end,
}
