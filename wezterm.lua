local Config = require('config')
local wezterm = require 'wezterm'

require('utils.backdrops'):set_files():random()

require('events.right-status').setup()
require('events.tab-title').setup()
require('events.new-tab-button').setup()

   wezterm.log_info 'Hello!'

return Config:init()
   :append(require('config.appearance'))
   :append(require('config.fonts'))
   :append(require('config.bindings'))
  -- :append(require('config.domains'))
   :append(require('config.general')).options
   --:append(require('config.launch')).


