local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

require("dap.javascript")
require("dap.csharp")

require("telescope").load_extension("dap")

-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
-- overrides for catppuccin
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

nmap("<leader>db", function()
  dap.toggle_breakpoint()
end, "DAP toggle breakpoint")

nmap("<leader>dt", function()
  dap.terminate()
end, "DAP toggle breakpoint")

nmap("<leader>dc", function()
  dap.run_to_cursor()
end, "DAP run to cursor")

nmap("<leader>dr", function()
  dap.continue()
end, "DAP continue")

nmap("<leader>di", function()
  dap.step_into()
end, "DAP step into")

nmap("<leader>du", function()
  dap.step_out()
end, "DAP step out")

nmap("<leader>do", function()
  dap.step_over()
end, "DAP step over")

nmap("<leader>dy", function()
  dapui.toggle()
end, "DAP UI open")

nmap("<leader>dd", function()
  dap.clear_breakpoints()
end, "DAP clear breakpoints")
