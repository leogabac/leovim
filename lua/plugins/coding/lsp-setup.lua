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

-- need to figure out how to setup this correctly
-- specially for a custom dictionary
-- require('ltex-ls').setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   use_spellfile = false,
--   filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
--   settings = {
--     ltex = {
--       enabled = { "latex", "tex", "bib", "markdown", },
--       language = "auto",
--       diagnosticSeverity = "information",
--       sentenceCacheSize = 2000,
--       additionalRules = {
--         enablePickyRules = true,
--         motherTongue = "fr",
--       },
--       disabledRules = {
--         fr = { "APOS_TYP", "FRENCH_WHITESPACE" }
--       },
--       dictionary = (function()
--         -- For dictionary, search for files in the runtime to have
--         -- and include them as externals the format for them is
--         -- dict/{LANG}.txt
--         --
--         -- Also add dict/default.txt to all of them
--         local files = {}
--         for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
--           local lang = vim.fn.fnamemodify(file, ":t:r")
--           local fullpath = vim.fs.normalize(file, ":p")
--           files[lang] = { ":" .. fullpath }
--         end
--
--         if files.default then
--           for lang, _ in pairs(files) do
--             if lang ~= "default" then
--               vim.list_extend(files[lang], files.default)
--             end
--           end
--           files.default = nil
--         end
--         return files
--       end)(),
--     },
--   },
-- }
