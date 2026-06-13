
-- File From:
-- ~/.config/hypr/hyprland.lua

local terminal = "kitty"
local fileManager = "dolphin"
local mainMod = "SUPER"
local noctCall = "qs -c noctalia-shell ipc call "
--------------
-- MONITORS --
--------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

-----------------
-- ENVIRONMENT --
-----------------
--
-- NOW MANAGED THROUGH `~.config/uwsm/env`
-- 
-- hl.env("XCURSOR_THEME", "LighTech-RE")
-- hl.env("XCURSOR_SIZE", "32")
-- hl.env("HYPRCURSOR_THEME", "LighTech-RE")
-- hl.env("HYPRCURSOR_SIZE", "32")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
---------------
-- AUTOSTART --
---------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start plasma-polkit-agent")
    hl.exec_cmd("uwsm app -- qs -c noctalia-shell")
    hl.exec_cmd("uwsm app -- clipse -listen")
    hl.exec_cmd("uwsm app -- easyeffects --daemon")
    hl.exec_cmd(noctCall .. "vesktop")
    hl.exec_cmd(noctCall .. "/opt/abdownloadmanager/bin/ABDownloadManager --background")
    hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
    hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")
end)

-----------------
-- CORE CONFIG --
-----------------

hl.config({

	misc = {
	    focus_on_activate = true,
	},
	
    cursor = {
        no_hardware_cursors = 1,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    general = {
        gaps_in = 4,
        gaps_out = 3,
        border_size = 2,

        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 9,
        rounding_power = 2,

        active_opacity = 0.91,
        inactive_opacity = 0.75,

        shadow = {
            enabled = true,
            range = 20,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.25,
            contrast = 0.5,
        },
    },

    animations = {
        enabled = true,
    },

    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = -0.345,
        numlock_by_default = true,

        touchpad = {
            natural_scroll = true,
        },
    },
})

-------------
-- LAYOUTS --
-------------

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

----------------
-- ANIMATIONS --
----------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("easeInOutSine",  {
	type = "bezier",
	points = { { 0.37, 0 }, {0.63, 1} },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = { { 0.65, 0.05 }, { 0.36, 1 } },
})

hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } },
})

hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 71.2633,
    dampening = 15.8273644,
})

hl.animation({ leaf = "global",        enabled = true, speed = 10,    bezier = "default"                               })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39,  bezier = "easeOutQuint"                          })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79,  spring = "easy",                                 })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 8.1,   spring = "easy",            style = "slide"      })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49,  bezier = "almostLinear",    style = "slide"      })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73,  bezier = "almostLinear"                          })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46,  bezier = "almostLinear"                          })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03,  bezier = "quick"                                 })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81,  bezier = "easeOutQuint"                          })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,     bezier = "easeOutQuint",    style = "fade"       })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,   bezier = "linear",          style = "fade"       })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79,  bezier = "almostLinear"                          })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39,  bezier = "almostLinear"                          })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94,  bezier = "easeInOutSine",   style = "fade"       })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.41,  bezier = "easeInOutSine",   style = "fade"       })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94,  bezier = "easeInOutSine",   style = "fade"       })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,     bezier = "quick"                                 })

--------------
-- GESTURES --
--------------

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    scale = 3,
    action = "workspace",
})

hl.gesture({
    fingers = 3,
    direction = "up",
    scale = 2.5,
    action = "fullscreen",
})

-------------
-- DEVICES --
-------------

hl.device({
    name = "elan0788:00-04f3:321a-touchpad",
    sensitivity = -0.125,
})

-----------------
-- KEYBINDINGS --
-----------------
hl.bind("CTRL + SHIFT + B", hl.dsp.exec_cmd("uwsm app -- kitty -e btop"))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("uwsm app -- " .. terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm app -- " .. fileManager))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd("uwsm app -- rofi -show drun"))
hl.bind("Menu", hl.dsp.exec_cmd(noctCall .. "launcher toggle"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctCall .. " lockScreen lock"))

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("uwsm app -- zen-browser"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("uwsm app -- vesktop"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("uwsm app -- spotify-launcher"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("uwsm app -- kcalc"))
hl.bind("XF86Launch2", hl.dsp.exec_cmd(noctCall .. "sessionMenu toggle"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("uwsm app -- kitty --class clipse -e clipse"))

-- Emoji Picker
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("uwsm app -- emote"))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Partial Screenshot captured" -t 700]]))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([[grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot captured" -t 700]]))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
------------------
-- WINDOW RULES --
------------------

hl.window_rule({
    name = "clipse",
    match = { class = "^(clipse)$" },
    float = true,
    size = { 920, 650 },
})

hl.window_rule({ 
   match = { class = "org.kde.kcalc" },
   float = true,
   
})
   
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = { 20, "monitor_h-120" },
    float = true,
})

--------------
-- NOCTALIA --
--------------
local colors_path = os.getenv("HOME") .. "/.config/hypr/noctalia/noctalia-colors.conf"
local file = io.open(colors_path, "r")
local c = {} 

if file then
    for line in file:lines() do
        local var_name, hex = line:match("%$([%w_]+)%s*=%s*rgb%((%w+)%)")      
        if var_name and hex then
            c[var_name] = "rgb(" .. hex .. ")"
        end
    end
    file:close()
else
    print("Did not find noctalia file")
end

if c.primary then
    hl.config({
        general = {
            col = {
                active_border   = c.primary,
                inactive_border = c.surface,
            }
        },
        
        group = {
            col = {
                border_active          = c.secondary,
                border_inactive        = c.surface,
                border_locked_active   = c.error,
                border_locked_inactive = c.surface,
            },
            
            groupbar = {
                col = {
                    active          = c.secondary,
                    inactive        = c.surface,
                    locked_active   = c.error,
                    locked_inactive = c.surface,
                }
            }
        }
    })
end
