local wezterm = require("wezterm")

-- config builder
local config = wezterm.config_builder()

-- config.color_scheme = "Tokyo Night"
-- config.font = wezterm.font_with_fallback({
--   {family = "JetBrainsMonoNerdFont", scale = 0.9}
-- })

config.font = wezterm.font("JetBrainsMonoNerdFont")
config.font_size = 10.5

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  bottom = 0,
  top = 0,
}

config.window_background_image = '/home/rom/.config/wezterm/background/ghost_in_the_shell.jpg'
-- config.window_background_image = '/home/rom/.config/wezterm/background/akira.jpg'
config.window_background_image_hsb = {
  brightness = 0.05,
  hue = 1.0,
  saturation = 1.0,
}

config.default_prog = {'/usr/bin/fish'}


-- config.disable_default_key_bindings = true


local act = wezterm.action

config.keys = {
  {
    key = 'n',
    mods = 'ALT',
    action = act.Multiple {
      act.ActivateKeyTable {
        name = 'disabled',
        one_shot = false
      },
      -- act.SendString:q

    }
  },
  {
    key = 'P',
    mods = 'CTRL',
    action = "ActivateCommandPalette"
  },
  {
    key = 'Space',
    mods = 'CTRL',
    action = 'ActivateCopyMode'
  },
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom 'Clipboard'
  },
  {
    key = "Enter",
    mods = "ALT",
    action = 'SpawnWindow'
  }


}


-- local act = wezterm.action
local copy_mode2 = {
  {
    key = 'w',
    mods = None,
    action = act.CopyMode 'MoveForwardWordEnd'
  },
  {
    key = 'b',
    mods = None,
    action = act.CopyMode 'MoveBackwardWord'
  },
  {
    key = "j",
    mods = None,
    action = act.CopyMode "MoveUp"
  },

  {
    key = "k",
    mods = None,
    action = act.CopyMode "MoveLeft"
  },
  {
    key = "l",
    mods = None,
    action = act.CopyMode "MoveRight"
  },
  {
    key = ";",
    mods = None,
    action = act.CopyMode "MoveDown"
  },
  {
    key = 'v',
    mods = None,
    action = act.CopyMode { SetSelectionMode = 'Cell' }
  },
  {
    key = 'v',
    mods = "SHIFT",
    action = act.CopyMode { SetSelectionMode = 'Line' }
  },
  {
    key = 'v',
    mods = "CTRL",
    action = act.CopyMode { SetSelectionMode = 'Block' }
  },
  {
    key = 'Escape',
    mods = None,
    action = act.CopyMode 'ClearSelectionMode'
  },
  {
    key = 'Escape',
    mods = 'CTRL',
    action = act.Multiple { act.ClearSelection, act.CopyMode 'Close' }
  },


  {
    key = 'c',
    mods = None,
    action = act.Multiple {
      act.CopyTo 'Clipboard',
      act.ClearSelection,
      act.CopyMode 'Close'
    }
  }
}



config.key_tables = {
  copy_mode = copy_mode2,
  search_mode = {},
  disabled = {
    {
      key = 'Escape',
      mods = 'CTRL',
      action = 'PopKeyTable'
    },

    {
      key = 'p',
      mods = 'CTRL',
      action = 'Nop'
    },
    {
      key = 'P',
      mods = 'CTRL',
      action = 'Nop'
    },
    {
      key = 'P',
      mods = 'CTRL|SHIFT',
      action = 'Nop'
    },
  },

}







return config

