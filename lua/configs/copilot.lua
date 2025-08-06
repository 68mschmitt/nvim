return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
        {  "github/copilot.vim"  }
    },
    build = "make tiktoken",
    opts = {
        -- See Configuration section for options
    },
    keys = {
        { "<leader>ac", "<cmd>CopilotChatToggle<cr>", desc = "Toggle CopilotChat" },
        { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
        { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review code" },
    },
}
