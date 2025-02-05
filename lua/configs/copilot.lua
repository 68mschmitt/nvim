return
function()
    require('copilot').setup({
        panel = {
            auto_refresh = true,
            keymap = {
                open = "<leader>cp",
            }
        },
        suggestion = {
            auto_trigger = true,
            hide_during_completion = false,
            keymap = {
                accept = "<leader>cy",
            }
        }
    })
end
