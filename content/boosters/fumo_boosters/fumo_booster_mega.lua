SMODS.Booster {
    key = "fumo_booster_mega",
    kind = "fumo",
    atlas = "boosters",
    group_key = "fumo_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.fumo_mega,
    pos = {
        x = 2,
        y = 3
    },
    config = {
        extra = 5,
        choose = 2,
        name = "Mega fumo pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "fumo",
                colours = {HEX(Kivolatro.colors.fumo)}
            }
        }
    end,
    pools = {
        ["fumo"] = true
    },
    cost = 5,
    weight = 0.05,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.fumo))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.fumo),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_fumo', true, true, nil, nil)
    end
}
