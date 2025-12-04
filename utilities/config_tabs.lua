local kivolatroConfigTab = function() -- based on cryptid
    kivo_nodes = {{
        n = G.UIT.R,
        config = {
            align = "cm"
        },
        nodes = {{
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = "Misc Config",
                    colours = {G.C.WHITE},
                    shadow = true,
                    scale = 0.4
                })
            }
        }}
    }}
    left_settings = {
        n = G.UIT.C,
        config = {
            align = "tl",
            padding = 0.05
        },
        nodes = {}
    }
    right_settings = {
        n = G.UIT.C,
        config = {
            align = "tl",
            padding = 0.05
        },
        nodes = {}
    }
    config = {
        n = G.UIT.R,
        config = {
            align = "tm",
            padding = 0
        },
        nodes = {left_settings, right_settings}
    }
    kivo_nodes[#kivo_nodes + 1] = config
    kivo_nodes[#kivo_nodes + 1] = create_toggle({
        label = "Menu change",
        active_colour = HEX(Kivolatro.colors.kivo),
        ref_table = Kivolatro_config,
        ref_value = "menu_change"
    })
    kivo_nodes[#kivo_nodes + 1] = create_toggle({
        label = "Blue Archive music",
        active_colour = HEX(Kivolatro.colors.kivo),
        ref_table = Kivolatro_config,
        ref_value = "blue_music"
    })
    kivo_nodes[#kivo_nodes + 1] = create_toggle({
        label = "Boss musics",
        active_colour = HEX(Kivolatro.colors.kivo),
        ref_table = Kivolatro_config,
        ref_value = "boss_music"
    })
    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            minh = 6,
            r = 0.1,
            minw = 10,
            align = "cm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = kivo_nodes
    }
end

local kivoTabs = function()
    return {{
        label = "Musics",
        tab_definition_function = function()
            cry_nodes = {{
                n = G.UIT.R,
                config = {
                    align = "cm"
                },
                nodes = {}
            }}
            settings = {
                n = G.UIT.C,
                config = {
                    align = "tl",
                    padding = 0.05
                },
                nodes = {}
            }
            settings.nodes[#settings.nodes + 1] = create_toggle({
                active_colour = HEX(Kivolatro.colors.kivo),
                label = "Always Drifting",
                ref_table = Kivolatro_config.Kivolatro,
                ref_value = "Always_Drifting"
            })
            settings.nodes[#settings.nodes + 1] = create_toggle({
                active_colour = HEX(Kivolatro.colors.kivo),
                label = "Track 292",
                ref_table = Kivolatro_config.Kivolatro,
                ref_value = "track_292"
            })
            config = {
                n = G.UIT.R,
                config = {
                    align = "tm",
                    padding = 0
                },
                nodes = {settings}
            }
            cry_nodes[#cry_nodes + 1] = config
            return {
                n = G.UIT.ROOT,
                config = {
                    emboss = 0.05,
                    minh = 6,
                    r = 0.1,
                    minw = 10,
                    align = "cm",
                    padding = 0.2,
                    colour = G.C.BLACK
                },
                nodes = cry_nodes
            }
        end
    }}
end

SMODS.current_mod.config_tab = kivolatroConfigTab
SMODS.current_mod.extra_tabs = kivoTabs
