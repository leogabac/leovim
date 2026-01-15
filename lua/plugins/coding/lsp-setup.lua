local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        -- disable everything since I only want
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pylint = { enabled = false },
        pyflakes = { enabled = false },
        flake8 = { enabled = false },
        mccabe = { enabled = false },
        pydocstyle = { enabled = false },
        rope_autoimport = { enabled = false },
        rope_completion = { enabled = false },
        pylsp_mypy = { enabled = false },
        pylsp_black = { enabled = false },
        pylsp_isort = { enabled = false },

        -- enable only pycodestyle
        pycodestyle = {
          enabled = true,
          maxLineLength = 120,
          ignore = {
            "E402", -- import not at top of file
            "E731", -- do not assign lambda expression
            "W503", -- line break before binary operator
          },
        },
      },
    },
  },
})

-- Setup ruff-lsp for linting only (no autoformat on save)

lspconfig.ruff.setup({
  settings = {
    -- optional: override ruff config here if needed
    -- for example, select rules or line-length
  },
  on_attach = function(client, bufnr)
    -- optional: you can still bind a manual formatting key
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<leader>rf", function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, { buffer = bufnr, desc = "Ruff: Format buffer" })
    end
  end,
})

lspconfig.ltex.setup({})

-- require'ltex-ls'.setup {
--   use_spellfile = false, -- Uses the value of 'spellfile' as an external file when checking the document
--   window_border = 'single', -- How the border should be rendered
--   -- Put your lsp config here, just like with nvim-lspconfig
-- }
