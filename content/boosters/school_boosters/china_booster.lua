SMODS.Booster {
    key = "china_booster",
    kind = "china",
    atlas = "boosters",
    group_key = "school_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.china_booster,
    pos = {
        x = 3,
        y = 4
    },
    config = {
        extra = 5,
        choose = 2,
        name = "china pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "school",
                colours = {HEX(Kivolatro.colors.shanhaijing), HEX(Kivolatro.colors.hyakkiyako)}
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
        ease_colour(G.C.DYN_UI.MAIN, Kivolatro.china_random_color())
        ease_background_colour({
            new_colour = Kivolatro.china_random_color(),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("china_students", G.pack_cards, nil, nil, true, true, nil, "kivo_china_students")
    end
}
