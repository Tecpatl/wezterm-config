local platform = require('utils.platform')()

local options = {
}

if platform.is_win then
  local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}
  options.default_prog = gitbash
-- elseif platform.is_mac then
--    options.default_prog = { 'zsh' }
--    options.launch_menu = {
--       { label = 'Bash', args = { 'bash' } },
--       { label = 'Zsh', args = { 'zsh' } },
--    }
-- elseif platform.is_linux then
--    options.default_prog = { 'zsh' }
--    options.launch_menu = {
--       { label = 'Bash', args = { 'bash' } },
--       { label = 'Zsh', args = { 'zsh' } },
--    }
end

return options
