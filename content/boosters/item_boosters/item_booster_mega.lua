SMODS.Booster {
    key = "item_booster_mega",
    kind = "item",
    atlas = "boosters",
    group_key = "item_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.item_mega,
    pos = {
        x = 2,
        y = 1
    },
    config = {
        extra = 5,
        choose = 2,
        name = "Mega item pack"
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
    cost = 8,
    weight = 0.1,
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
