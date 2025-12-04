SMODS.Booster {
    key = "resource_booster_jumbo",
    kind = "resource",
    atlas = "boosters",
    group_key = "resource_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.resources_jumbo,
    pos = {
        x = 4,
        y = 2
    },
    config = {
        extra = 5,
        choose = 1,
        name = "Jumbo resources pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "resource",
                colours = {HEX(Kivolatro.colors.resource)}
            }
        }
    end,
    pools = {
        ["resource"] = true
    },
    cost = 5,
    weight = 0.5,
    draw_hand = true,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.resource))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.resource),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("resources", G.pack_cards, nil, nil, true, true, nil, "kivo_boosters")
    end
}
