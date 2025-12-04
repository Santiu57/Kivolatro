SMODS.Booster {
    key = "trinity_booster",
    kind = "trinity",
    atlas = "boosters",
    group_key = "school_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.trinity_booster,
    pos = {
        x = 0,
        y = 4
    },
    config = {
        extra = 5,
        choose = 2,
        name = "Trinity pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "school",
                colours = {HEX(Kivolatro.colors.trinity)}
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
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.trinity))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.trinity),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("trinity_students", G.pack_cards, nil, nil, true, true, nil, "kivo_trinity_students")
    end
}
