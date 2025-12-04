SMODS.Booster {
    key = "item_booster_normal",
    kind = "Item",
    atlas = "boosters",
    group_key = "item_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.item,
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = 3,
        choose = 1,
        name = "Item pack"
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
    cost = 4,
    weight = 0.35,
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
