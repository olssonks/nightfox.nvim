local M = {}

function M.get(spec, config, opts)
  local c = spec.palette

  local rainbow = {c.pink, c.blue, c.green, c.yellow, c.orange, c.red, c.magenta}
  
  local C = require "nightfox.lib.color"

  local groups = {
    RenderMarkdownCode = { bg = c.bg0 },
    RenderMarkdownCodeInline = { fg=c.cyan.bright, bg = c.bg0 },
    RenderMarkdownBullet = { fg = c.green.bright },
    RenderMarkdownTableHead = { fg = c.blue.base },
    RenderMarkdownTableRow = { fg = c.pink.base },
    RenderMarkdownSuccess = { fg = c.green.bright },
    RenderMarkdownInfo = { fg = c.magenta.base },
    RenderMarkdownHint = { fg = c.cyan.base },
    RenderMarkdownWarn = { fg = c.yellow.base},
    RenderMarkdownError = { fg = c.red.base },
  }

  for i, color in ipairs(rainbow) do
    local new_bg = C.from_hex(color.base):shade(-0.45)
    groups["RenderMarkdownH" .. i] = { fg = color.base }
    groups["@markup.heading." .. i .. ".markdown"] = { fg = color.base }
    groups["RenderMarkdownH" .. i .. "Bg"] = { bg = new_bg:to_hex() }
  end

  return groups
end

return M
