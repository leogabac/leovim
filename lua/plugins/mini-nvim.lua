return {
  -- move text in any direction
  {
    "echasnovski/mini.move",
    version = false,
    config = function()
      local minimove = require("mini.move")
      minimove.setup()
    end,
  },
  -- open and close parenthesis
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      local minipairs = require("mini.pairs")
      minipairs.setup({
        mappings = {
          ["<"] = { action = "open", pair = "<>", lhs = "<", rhs = ">" },
          [">"] = { action = "close", pair = "<>", lhs = "<", rhs = ">" },
        },
      })
    end,
  },

}
