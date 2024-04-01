local wezterm = require('wezterm')
local platform = require('utils.platform')()

local font_size = platform.is_mac and 12 or 9

local font = {}
if platform.is_mac then
   font = {
      'MesloLGS NF',
   }
elseif platform.is_linux then
   font = {
      'MesloLGM Nerd Font Mono',
      'Noto Sans CJK HK',
   }
end

return {
   font = wezterm.font_with_fallback(font),
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
