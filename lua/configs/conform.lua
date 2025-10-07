local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    python = { "isort", "black" },
  },
  formatters = {
    prettier = {
      prepend_args = {
        "--single-quote",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    async = false,
    lsp_fallback = true,
  },
}

return options
