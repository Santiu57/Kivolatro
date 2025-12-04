SMODS.Booster {
    key = "arm_booster_mega",
    kind = "Arm",
    atlas = "boosters",
    group_key = "arm_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.arm_mega,
    pos = {
        x = 5,
        y = 0
    },
    config = {
        extra = 5,
        choose = 2,
        name = "Mega fire arm pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "arm",
                colours = {HEX(Kivolatro.colors.arm)}
            }
        }
    end,
    pools = {
        ["arm"] = true
    },
    cost = 6,
    weight = 0.1,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.arm))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.arm),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_arm', true, true, nil, nil)
    end
}
