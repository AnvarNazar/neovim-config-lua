return {
	"nvim-treesitter/nvim-treesitter",
	build = function ()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "php_only", "php", "javascript", "html" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			}
		})
		parser_config.blade = {
			install_info = {
            			url = "http://github.com/EmranMR/tree-sitter-blade",
            		    	files = {"src/parser.c"},
            		    	branch = "main",
            		},
			filetype = "blade"
		}

	end
}
