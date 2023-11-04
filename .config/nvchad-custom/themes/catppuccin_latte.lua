local latte = require("catppuccin.palettes").get_palette "latte"

-- local rosewater = "#dc8a78"
-- local flamingo = "#dd7878"
-- local pink = "#ea76cb"
-- local mauve = "#8839ef"
-- local red = "#d20f39"
-- local maroon = "#e64553"
-- local peach = "#fe640b"
-- local yellow = "#df8e1d"
-- local green = "#40a02b"
-- local teal = "#179299"
-- local sky = "#04a5e5"
-- local sapphire = "#209fb5"
-- local blue = "#1e66f5"
-- local lavender = "#7287fd"
-- local text = "#4c4f69"
-- local subtext1 = "#5c5f77"
-- local subtext0 = "#6c6f85"
-- local overlay2 = "#7c7f93"
-- local overlay1 = "#8c8fa1"
-- local overlay0 = "#9ca0b0"
-- local surface2 = "#acb0be"
-- local surface1 = "#bcc0cc"
-- local surface0 = "#ccd0da"
-- local base = "#eff1f5"
-- local mantle = "#e6e9ef"
-- local crust = "#dce0e8"

local M = {}

M.base_30 = {
    white = latte.base,
    darker_black = latte.crust,
    black = latte.base, --  nvim bg
    black2 = latte.surface0,
    one_bg = latte.base, -- real bg of onedark
    one_bg2 = latte.crust,
    one_bg3 = latte.surface0,
    grey = latte.base,
    grey_fg = latte.crust,
    grey_fg2 = latte.surface0,
    light_grey = latte.surface0,
    red = latte.red,
    baby_pink = latte.flamingo,
    pink = latte.pink,
    line = latte.lavender, -- for lines like vertsplit
    green = latte.green,
    vibrant_green = latte.green,
    nord_blue = latte.sapphire,
    blue = latte.blue,
    yellow = latte.yellow,
    sun = latte.peach,
    purple = latte.mauve,
    dark_purple = latte.mauve,
    teal = latte.teal,
    orange = latte.peach,
    cyan = latte.sky,
    statusline_bg = latte.crust,
    lightbg = latte.surface1,
    pmenu_bg = "#ABE9B3",
    folder_bg = latte.mauve,
    lavender = latte.lavender,
}

M.base_16 = {
  base00 = latte.base,
  base01 = latte.mantel,
  base02 = latte.mauve,
  base03 = latte.overlay0,
  base04 = latte.surface0,
  base05 = latte.sky,
  base06 = latte.pink,
  base07 = latte.pink,
  base08 = latte.yellow,
  base09 = latte.peach,
  base0a = latte.yellow,
  base0b = latte.green,
  base0c = latte.pink,
  base0d = latte.blue,
  base0e = latte.mauve,
  base0f = latte.overlay2,
}

-- M.polish_hl = {
--   ["@variable"] = { fg = M.base_30.lavender },
--   ["@property"] = { fg = M.base_30.mauve },
--   ["@variable.builtin"] = { fg = M.base_30.red },
-- }

M.type = "light"

return M
