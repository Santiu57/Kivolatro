-- Make vanilla editions aply to float sprites
G.P_CENTERS.e_foil.apply_to_float = true
G.P_CENTERS.e_holo.apply_to_float = true
G.P_CENTERS.e_polychrome.apply_to_float = true
G.P_CENTERS.e_negative.apply_to_float = true

-- changing the background colors and adding a card to the main menu

G.C.kivo_color = HEX(Kivolatro.colors.kivo)
G.C.kivo_color_2 = HEX("80dada")

if Kivolatro_config.menu_change then
    local oldfunc = Game.main_menu
    Game.main_menu = function(change_context)
        local ret = oldfunc(change_context)
        -- adds a card to the main menu
        local newcard = Card(G.title_top.T.x, G.title_top.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty,
            G.P_CENTERS.j_kivo_seia_drift, {
                bypass_discovery_center = true
            })
        -- recenter the title
        G.title_top.T.w = G.title_top.T.w * 1.7675
        G.title_top.T.x = G.title_top.T.x - 0.8
        G.title_top:emplace(newcard)
        -- make the card look the same way as the title screen Ace of Spades
        newcard.T.w = newcard.T.w * 1.1 * 1.2
        newcard.T.h = newcard.T.h * 1.1 * 1.2
        newcard.no_ui = true
        newcard.states.visible = false

        -- make the title screen use different background colors
        G.SPLASH_BACK:define_draw_steps({{
            shader = "splash",
            send = {{
                name = "time",
                ref_table = G.TIMERS,
                ref_value = "REAL_SHADER"
            }, {
                name = "vort_speed",
                val = 0.4
            }, {
                name = "colour_1",
                ref_table = G.C,
                ref_value = "kivo_color"
            }, {
                name = "colour_2",
                ref_table = G.C,
                ref_value = "kivo_color_2"
            }}
        }})

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0,
            blockable = false,
            blocking = false,
            func = function()
                if change_context == "splash" then
                    newcard.states.visible = true
                    newcard:start_materialize({HEX(Kivolatro.student_Colors.mari), HEX(Kivolatro.student_Colors.mari)}, true, 2.5)
                else
                    newcard.states.visible = true
                    newcard:start_materialize({HEX(Kivolatro.student_Colors.mari), HEX(Kivolatro.student_Colors.mari)}, nil, 1.2)
                end
                return true
            end
        }))

        return ret
    end
end
