SMODS.Booster {
    key = "q_booster",
    kind = "???",
    atlas = "q_booster_atlas",
    loc_txt = Kivolatro.loc.buffoon_pack.q,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = 3,
        choose = 1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "fumo",
                colours = {HEX(Kivolatro.colors.q)}
            }
        }
    end,
    pools = {
        ["?"] = true
    },
    cost = 12,
    weight = 0.05,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.q))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.q),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_?', true, true, nil, nil)
    end
}
