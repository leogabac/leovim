-- requires imagemagick
return {
  {
    "hrsh7th/nvim-pasta",
    event = "BufEnter",
    config = function()
      -- Verify system dependencies on startup
      if vim.fn.has("linux") == 1 then
        if vim.fn.executable("wl-paste") == 0 then
          vim.notify("Missing dependency: wl-clipboard\nInstall with: sudo pacman -S wl-clipboard", vim.log.levels
          .WARN)
        end
        if vim.fn.executable("identify") == 0 then
          vim.notify("Missing dependency: imagemagick\nInstall with: sudo pacman -S imagemagick", vim.log.levels.WARN)
        end
      end

      local function paste_latex_figure()
        -- Create images directory relative to current file
        local img_dir = vim.fn.expand("%:p:h") .. "/images"
        if vim.fn.isdirectory(img_dir) == 0 then
          vim.fn.mkdir(img_dir, "p")
        end

        -- generate filenames
        local timestamp = os.date("%Y%m%d_%H%M%S")
        local img_path = img_dir .. "/figure_" .. timestamp .. ".png"
        local rel_path = "images/figure_" .. timestamp .. ".png"

        -- and try multiple formats (Wayland clipboard)
        local mime_types = { "image/png", "image/jpeg", "image/bmp", "image/tiff" }
        local success = false

        for _, mime in ipairs(mime_types) do
          if os.execute("wl-paste --type " .. mime .. " > " .. vim.fn.shellescape(img_path)) == 0 then
            success = true
            break
          end
        end

        if not success then
          vim.notify("No supported image found in clipboard (PNG/JPEG/BMP/TIFF)", vim.log.levels.ERROR)
          return
        end

        -- this section is to be smart on how wide my figure should be 
        -- to kind of respect OG dimensions

        local width = "0.7\\textwidth" -- Default
        local handle = io.popen("identify -format \"%w\" " .. vim.fn.shellescape(img_path) .. " 2>/dev/null")
        if handle then
          local pixels = handle:read("*n")
          handle:close()
          if pixels then
            -- Scale based on pixel width (ansatz)
            width = math.min(0.9, math.max(0.4, (pixels / 1200))) .. "\\textwidth"
          end
        end
        -- create latex input (store as table for line counting)
        local latex_lines = {
          "\\begin{figure}[htbp]",
          "  \\centering",
          "  \\includegraphics[width=" .. width .. "]{" .. rel_path .. "}",
          "  \\caption{}", -- Line 4 (zero-indexed)
          "  \\label{fig:" .. timestamp .. "}",
          "\\end{figure}"
        }

        -- insert at current cursor position
        local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
        vim.api.nvim_buf_set_lines(0, row, row, false, latex_lines)

        -- move cursor to THIS figure's caption (4 lines down)
        vim.api.nvim_win_set_cursor(0, { row + 4, 14 }) -- 14 = inside braces

        -- insert mode
        vim.cmd("startinsert")
      end

      vim.keymap.set("n", "<leader>lf", paste_latex_figure, { desc = "Paste LaTeX figure" }) -- Optional: Auto-cleanup failed pastes
      vim.api.nvim_create_autocmd("VimLeave", {
        callback = function()
          os.execute("find . -name 'figure_*.png' -size 0 -delete 2>/dev/null")
        end
      })
    end
  }
}
