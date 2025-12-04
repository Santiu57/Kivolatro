SMODS.Booster {
    key = "millennium_booster",
    kind = "millennium",
    atlas = "boosters",
    group_key = "school_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.millennium_booster,
    pos = {
        x = 2,
        y = 4
    },
    config = {
        extra = 5,
        choose = 2,
        name = "millennium pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "school",
                colours = {HEX(Kivolatro.colors.millennium)}
            }
        }
    end,
    pools = {
        ["school_packs"] = true
    },
    cost = 10,
    weight = 0.1,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.millennium))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.millennium),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("millennium_students", G.pack_cards, nil, nil, true, true, nil, "kivo_millennium_students")
    end
}
