SMODS.Booster {
    key = "arm_booster_normal",
    kind = "Arm",
    atlas = "boosters",
    group_key = "arm_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.arm,
    pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = 3,
        choose = 1,
        name = "Fire arm's pack"
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
    cost = 4,
    weight = 0.35,
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
