require("nvchad.configs.lspconfig").defaults()

vim.lsp.config('lua_ls', {
  on_init = function (client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'Lua 5.3',
      },
      completion = {
        callSnippet = 'Replace',
      },
      workspace = {
        library = {
          '${3rd}/love2d/library',
        },
      },
      diagnostics = {
        globals = { 'vim', 'love' },
      },
    })
  end,
  settings = {
    Lua = {}
  }
})

local servers = { "html", "cssls", "ts_ls", "lua_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
--
