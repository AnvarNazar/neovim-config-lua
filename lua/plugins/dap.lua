return {
	"mfussenegger/nvim-dap",
	config = function ()
		local dap = require("dap")
		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js"},
		}

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = '/home/anvar/Programs/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
        }

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003,
			},
		}

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                args = function ()
                    local args_str = vim.fn.input("Arguments: ")
                    return vim.split(args_str, " ")
                end,
                stopAtEntry = false,
            },
            -- {
            --     name = 'Attach to gdbserver :1234',
            --     type = 'cppdbg',
            --     request = 'launch',
            --     MIMode = 'gdb',
            --     miDebuggerServerAddress = 'localhost:1234',
            --     miDebuggerPath = '/usr/bin/gdb',
            --     cwd = '${workspaceFolder}',
            --     program = function()
            --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --     end,
            -- },
        }

		vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
		vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
		vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
		vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
		vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
		vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
		vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
		vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
		vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
		vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
		  require('dap.ui.widgets').hover()
		end)
		vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
		  require('dap.ui.widgets').preview()
		end)
		vim.keymap.set('n', '<Leader>df', function()
		  local widgets = require('dap.ui.widgets')
		  widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set('n', '<Leader>ds', function()
		  local widgets = require('dap.ui.widgets')
		  widgets.centered_float(widgets.scopes)
		end)

	end,
}
