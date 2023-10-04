if (vim.loop.os_gethostname() ~= "H4LTF41GY0") then
    require('copilot').setup({
        suggestion = { enabled = true },
        panel = { enabled = true },
    })
    require('copilot_cmp').setup()
end
