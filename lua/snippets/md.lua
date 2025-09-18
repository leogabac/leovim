local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- ============================================
  -- simple text abbreviations
  -- ============================================

  -- ============================================
  -- more involved wrappers, and inserts
  -- ============================================

  -- inline math mode
  s("cc", fmt("`<>`", { i(0) }, { delimiters = "<>" })),
  -- generic environment
  s(
    "env",
    fmt(
      [[
			```
			<>
			```
		]],
      { i(0) },
      { delimiters = "<>" }
    )
  ),
  -- placeholder text for figures
  s("needfig", {
    t({ "\\vspace{1em} INCLUDE FIGURE OF" }),
    i(0),
    t({ "\\vspace{1em}" }),
  }),
}
