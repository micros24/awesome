-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
require("components.volume-adjust")
local screenshot = require("components.screenshot");

-- Polybar
awful.spawn{ "/home/micro/.config/polybar/launch.sh" }

-- Autorun
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
beautiful.init("/home/micro/.config/awesome/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
-- editor = os.getenv("EDITOR") or "nano"
-- editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile
}
-- }}}

for s in screen do    
    if s.index == 1 then
        awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    end
    if s.index == 2 then
        awful.tag({ "A", "B", "C", "D", "E", "F", "G", "H", "I" }, s, awful.layout.layouts[1])
    end
end

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Custom bindings
    awful.key({ "Mod1", }, "Tab", function ()
            awful.client.focus.byidx(1)end,
        {description = "focus next by index", group = "client"}),
    awful.key({ modkey, }, "f", function () 
            awful.spawn("firefox") end,
        {description = "open a browser", group = "client"}),
    awful.key({ "Control", "Mod1"}, "s", function () 
            awful.spawn("steam-native") end,
        {description = "open a browser", group = "client"}),
    awful.key({ modkey, }, "s", function () 
            awful.spawn("flatpak run com.spotify.Client") end,
        {description = "open spotify", group = "client"}),
    awful.key({ modkey, }, "e", function () 
            awful.spawn("pcmanfm-qt") end,
        {description = "open file manager", group = "client"}),
    awful.key({ modkey, }, "r", function () 
            awful.spawn("rofi -show drun") end,
        {description = "show runner", group = "client"}),
    awful.key({ modkey, }, "g", function () 
            awful.spawn("kate /home/micro/GW2") end,
        {description = "open GW2 daily list", group = "client"}),
    awful.key({ modkey, }, "Return", function () 
            awful.spawn(terminal) end,
        {description = "open a terminal", group = "client"}),
    awful.key({ modkey, }, "a", function () 
            awful.spawn("input-remapper-gtk") end,
        {description = "input remapper", group = "client"}),
    awful.key({ "Control", "Mod1" }, "Delete", function () 
            awful.spawn("wlogout") end,
        {description = "logout screen", group = "client"}),
    awful.key({ modkey, }, "m", function () 
            awful.spawn("easyeffects") end,
        {description = "easy effects", group = "client"}),
    awful.key({ modkey, }, "l", function () 
            awful.spawn("xlock -dpmsoff 60") end,
        {description = "lock screen", group = "client"}),
    awful.key({ modkey, }, "j", function () 
            awful.screen.focus_relative(1) end,
        {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, }, "q",   awful.tag.viewprev,
        {description = "view previous", group = "tag"}),
    awful.key({ modkey, }, "Tab",  awful.tag.viewnext,
        {description = "view next", group = "tag"}),
        
    -- Screenshot bindings
    awful.key({ }, "Print", scrot_window,
        {description = "screenshot active window", group = "client"}),
        
    -- Media bindings
    awful.key({ "", }, "XF86AudioRaiseVolume", function () 
            awful.spawn.with_shell("pamixer -i 2 --allow-boost", false) 
            awesome.emit_signal("volume_change") end,
        {description = "raide volume", group = "client"}),
    awful.key({ "", }, "XF86AudioLowerVolume", function () 
            awful.spawn.with_shell("pamixer -d 2 --allow-boost", false)
            awesome.emit_signal("volume_change") end,
        {description = "lower volume", group = "client"}),
    awful.key({ "", }, "XF86AudioPause", function () 
            awful.spawn.with_shell("playerctl play-pause", false) end,
        {description = "pause media", group = "client"}),
    awful.key({ "", }, "XF86AudioPlay", function () 
            awful.spawn.with_shell("playerctl play-pause", false) end,
        {description = "play media", group = "client"}),
    awful.key({ "", }, "XF86AudioNext", function () 
            awful.spawn.with_shell("playerctl next", false) end,
        {description = "next media", group = "client"}),
    awful.key({ "", }, "XF86AudioPrev", function () 
            awful.spawn.with_shell("playerctl previous", false) end,
        {description = "previous media", group = "client"}),
    -- awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    --           {description="show help", group="awesome"}),
    -- Layout manipulation
    -- awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    --           {description = "swap with next client by index", group = "client"}),
    -- awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    --           {description = "swap with previous client by index", group = "client"}),
    -- awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --           {description = "focus the previous screen", group = "screen"}),
    -- awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    --           {description = "jump to urgent client", group = "client"}),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"})
    -- awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    --          {description = "quit awesome", group = "awesome"})
)

clientkeys = gears.table.join(
    -- Custom bindings
    awful.key({ modkey, }, "w", function (c) 
            c:kill() end,
        {description = "close", group = "client"}),
        
    -- Toggle titlebar
    awful.key({ modkey, "Control" }, "t", function (c) 
            awful.titlebar.toggle(c) end,
        {description = "Show/Hide Titlebars", group="client"}),
    awful.key({ "Control", "Mod1"}, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),

    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    -- awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
    --           {description = "move to master", group = "client"}),
    awful.key({ modkey, "Control" }, "j",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"})
    -- awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
    --            {description = "toggle keep on top", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        awful.key({ modkey, "Shift" }, "j", function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                        if tag then
                            awful.client.movetoscreen()
                        end
                end end,
            {description = "move screens of the focused client"..i, group = "tag"})
        -- Toggle tag display.
        -- awful.key({ modkey, "Control" }, "#" .. i + 9,
        --           function ()
        --               local screen = awful.screen.focused()
        --               local tag = screen.tags[i]
        --               if tag then
        --                  awful.tag.viewtoggle(tag)
        --               end
        --           end,
        --           {description = "toggle tag #" .. i, group = "tag"}),
        
        -- Toggle tag on focused client.
        -- awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
        --           function ()
        --               if client.focus then
        --                   local tag = client.focus.screen.tags[i]
        --                   if tag then
        --                       client.focus:toggle_tag(tag)
        --                   end
        --               end
        --           end,
        --           {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- Custom rules
    { rule_any = { 
    	class = { 
    		"kate", 
    		"File-roller",
    		"Input-remapper-gtk"
    	}},
        properties = { opacity = 0.85 }},
    { rule_any = { class = {"VSCodium"}},
        properties = { opacity = 0.9 }},
    { rule = { name = "Spotify"},
        properties = { tag = screen[2].tags[9], switch_to_tags = true }},
    {rule = { class = "Psensor" },
        properties = { 
        	ontop = true,
        	floating = true,
        	placement = awful.placement.centered,
        	width     = 800,
        	height    = 550,
    }}, 
    { rule_any = { class = {"easyeffects"}},
        properties = { 
        	floating = true,
        	placement = awful.placement.centered,
        	width = 1536,
        	height = 768
    }},
        
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry"
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
          "File-roller",
          "Input-remapper-gtk"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
          "Volume Control",
          "Bluetooth Devices",
          "CoreCtrl",
          "Network Connections",
          "Friends List",
          "Bitwarden"
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          -- "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { 
        floating = true,
        placement = awful.placement.centered,
        width     = 1024,
        height    = 768,
        }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },
    
    -- Set Firefox to always map on the tag named "2" on s
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
    
    awful.titlebar.hide(c)
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width -- your border width
        end
    end
end)

         -- local paddingValue = { bottom = 18 }
	 -- awful.screen.focused().padding = paddingValue;
-- }}}
