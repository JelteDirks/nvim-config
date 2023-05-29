local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

require("telescope").load_extension("dap")

dap.adapters.coreclr = {
  type = 'executable',
  command = '/Users/jelte/personal/netcoredbg/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
-- overrides for catppuccin
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

nmap("<leader>db", function()
  dap.toggle_breakpoint()
end, "Toggles breakpoint for DAP")

nmap("<leader>dc", function()
  dap.run_to_cursor()
end, "DAP run to cursor")

nmap("<leader>dr", function()
  dap.continue()
end, "DAP continue")

nmap("<leader>di", function ()
  dap.step_into()
end, "DAP step into")

nmap("<leader>du", function ()
  dap.step_out()
end, "DAP step out")

nmap("<leader>do", function ()
  dap.step_over()
end, "DAP step over")

nmap("<leader>dy", function()
  dapui.toggle()
end, "DAP UI open")

nmap("<leader>dd", function()
  dap.clear_breakpoints()
end, "DAP clear breakpoints")


