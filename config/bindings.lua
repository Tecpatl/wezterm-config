local wezterm = require('wezterm')
local platform = require('utils.platform')()
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|SHIFT'
   mod.KEY = 'SUPER'
elseif platform.is_win then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|CTRL'
   mod.KEY = 'CTRL|SHIFT'
elseif platform.is_linux then
   mod.SUPER = 'ALT'
   mod.SUPER_REV = 'ALT|SHIFT'
   mod.KEY = 'CTRL|SHIFT'
end

local keys = {
   -- misc/useful --
   { key = 'X', mods = 'CTRL', action = wezterm.action.ActivateCopyMode },

   -- copy/paste --
   { key = 'c', mods = mod.KEY, action = act.CopyTo('Clipboard') },
   { key = 'v', mods = mod.KEY, action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't', mods = mod.SUPER, action = act.SpawnTab('DefaultDomain') },
   -- { key = 't', mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = 'WSL:Ubuntu' }) },
   { key = 'w', mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '{', mods = mod.SUPER_REV, action = act.ActivateTabRelative(-1) },
   { key = '}', mods = mod.SUPER_REV, action = act.ActivateTabRelative(1) },

   -- window --
   -- spawn windows
   { key = 'n', mods = mod.SUPER, action = act.SpawnWindow },

   -- background controls --
   {
      key = [[,]],
      mods = 'ALT',
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },

   -- panes --
   -- panes: split panes
   {
      key = 'd',
      mods = mod.SUPER_REV,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = 'd',
      mods = mod.SUPER,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },

  -- -- panes: zoom+close pane
   { key = 'w', mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = true }) },

   { key = 'q', mods = mod.SUPER, action = act.QuitApplication },

   -- resizes fonts
   { key = "+", mods = mod.KEY, action = act.IncreaseFontSize },
   { key = "-", mods = mod.KEY, action = act.DecreaseFontSize },
   { key = 'UpArrow', mods = mod.SUPER, action = act.ToggleFullScreen },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
}

return {
   disable_default_key_bindings = true,
   leader = { key = 'Space', mods = 'ALT|SHIFT' },
   keys = keys,
}
