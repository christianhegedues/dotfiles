local M = {}

M.separator = { '', '' }

M.colors = {
  active        = '%#StatusLine#',
  inactive      = '%#StatusLineNC#',
  mode          = '%#Mode#',
  mode_alt      = '%#ModeAlt#',
  git           = '%#Git#',
  git_alt       = '%#GitAlt#',
  filename      = '%#FileName#',
  filename_alt  = '%#FileNameAlt#',
  filetype      = '%#FileType#',
  filetype_alt  = '%#FileTypeAlt#',
  rowinfo       = '%#RowInfo#',
  rowinfo_alt   = '%#RowInfoAlt#',
}

M.modes = setmetatable({
  ['n']  = {'Normal', 'N'};
  ['no'] = {'N·Pending', 'N'} ;
  ['v']  = {'Visual', 'V' };
  ['V']  = {'Visual', 'V' };
  [''] = {'Visual', 'V'}; -- this is not ^V, but it's , they're different
  ['s']  = {'Select', 'S'};
  ['S']  = {'S·Line', 'S'};
  [''] = {'S·Block', 'S'}; -- same with this one, it's not ^S but it's 
  ['i']  = {'Insert', 'I'};
  ['ic'] = {'Insert', 'I'};
  ['R']  = {'Replace', 'R'};
  ['Rv'] = {'V·Replace', 'V'};
  ['c']  = {'Command', 'C'};
  ['cv'] = {'Vim·Ex ', 'V'};
  ['ce'] = {'Ex ', 'E'};
  ['r']  = {'Prompt ', 'P'};
  ['rm'] = {'More ', 'M'};
  ['r?'] = {'Confirm ', 'C'};
  ['!']  = {'Shell ', 'S'};
  ['t']  = {'Terminal ', 'T'};
}, {
  __index = function()
      return {'Unknown', 'U'} -- handle edge cases
  end
})

M.get_current_mode = function(self)
  return string.format(" %s ", self.modes[vim.api.nvim_get_mode().mode][2]):upper()
end

M.get_git_status = function()
  local signs = vim.b.gitsigns_status_dict or { head = "" }
  local is_head_empty = signs.head ~= ""

  return is_head_empty and string.format("  %s ", signs.head:upper() or "") or ""
end

M.get_filename = function()
  return " %m%r %<%t "
end

M.get_filetype = function()
  local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
  local filetype = vim.bo.filetype

  if filetype == '' then return '' end
  return string.format(' %s %s ', icon, filetype):upper()
end

M.get_fileformat = function()
  return string.format(" %s ", "%{&ff}")
end

M.get_rowinfo = function()
  return string.format(" %s ", "%l/%L (%p%%)")
end

M.set_active = function(self)
  local mode = self.colors.mode .. self:get_current_mode()
  local mode_alt = self.colors.mode_alt .. self.separator[1]
  local git_alt = self.colors.git_alt .. self.separator[1]
  local git = self.colors.git .. self:get_git_status()
  local filename_alt = self.colors.filename_alt .. self.separator[1]
  local filename = self.colors.filename .. self:get_filename()
  -- local filetype_alt = self.colors.filetype_alt .. self.separator[2]
  -- local filetype = self.colors.filetype .. self:get_fileformat()
  local rowinfo_alt = self.colors.rowinfo_alt .. self.separator[2]
  local rowinfo = self.colors.rowinfo .. self:get_rowinfo()

  return table.concat({
    self.colors.active, mode, mode_alt, git_alt, git,
    filename_alt, filename, "%=",
    rowinfo_alt, rowinfo
  })
end

M.set_inactive = function(self)
  return "%#StatusLineNC" .. "%= %F %="
end

M.set_explorer = function(self)
  return "%#StatusLineNC#"
end

Statusline = setmetatable(M, {
  __call = function(self, mode)
      return self["set_" .. mode](self)
  end,
})

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]], false)

