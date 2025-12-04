SMODS.Booster {
    key = "choco_booster_jumbo",
    kind = "choco",
    atlas = "boosters",
    group_key = "choco_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.choco_jumbo,
    pos = {
        x = 4,
        y = 1
    },
    config = {
        extra = 5,
        choose = 1,
        name = "Jumbo choco pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "choco",
                colours = {HEX(Kivolatro.colors.choco)}
            }
        }
    end,
    pools = {
        ["choco"] = true
    },
    cost = 5,
    weight = 0.18,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.choco))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.choco),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_choco', true, true, nil, nil)
    end
}
