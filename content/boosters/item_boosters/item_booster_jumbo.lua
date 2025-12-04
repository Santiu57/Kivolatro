SMODS.Booster {
    key = "item_booster_jumbo",
    kind = "item",
    atlas = "boosters",
    group_key = "item_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.item_jumbo,
    pos = {
        x = 1,
        y = 1
    },
    config = {
        extra = 5,
        choose = 1,
        name = "Jumbo item pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "item",
                colours = {HEX(Kivolatro.colors.item)}
            }
        }
    end,
    pools = {
        ["item"] = true
    },
    cost = 6,
    weight = 0.18,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.item))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.item),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_item', true, true, nil, nil)
    end
}
