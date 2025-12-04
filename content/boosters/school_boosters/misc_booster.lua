SMODS.Booster {
    key = "misc_booster",
    kind = "misc",
    atlas = "boosters",
    group_key = "school_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.misc_booster,
    pos = {
        x = 4,
        y = 4
    },
    config = {
        extra = 5,
        choose = 2,
        name = "misc pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "school",
                colours = {HEX(Kivolatro.colors.valk), HEX(Kivolatro.colors.arius), HEX(Kivolatro.colors.srt),
                           HEX(Kivolatro.colors.red_winter), HEX(Kivolatro.colors.abydos), Kivolatro.misc_gradient}
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
        ease_colour(G.C.DYN_UI.MAIN, Kivolatro.misc_random_color())
        ease_background_colour({
            new_colour = Kivolatro.misc_random_color(),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("misc_students", G.pack_cards, nil, nil, true, true, nil, "kivo_misc_students")
    end
}
