return {
  {

    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        ensure_istalled = {},
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.codespell,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.diagnostics.curlylint,
          null_ls.builtins.formatting.djlint,

          null_ls.builtins.formatting.fourmolu

        },
      })
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
    end,
  },
  {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
      },
      config = function()
        require("mason-null-ls").setup({
          ensure_installed = {
            "stylua",
            "black",
            "prettier",
            "eslint_d",
            "codespell",
            "ruff",
          },
        })
      end,
  },
}
