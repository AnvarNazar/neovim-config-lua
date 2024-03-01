return {
	'dense-analysis/ale',
	config = function ()
			vim.g.ale_fixers = {'prettier', 'eslint'};
			vim.keymap.set('n', '<leader>F', '<Cmd>ALEFix<CR>');
	end
}
