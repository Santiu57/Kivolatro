SMODS.Booster {
    key = "meme_booster_jumbo",
    kind = "meme",
    atlas = "boosters",
    group_key = "meme_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.meme_jumbo,
    pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = 5,
        choose = 1,
        name = "Jumbo meme pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "meme",
                colours = {HEX(Kivolatro.colors.meme)}
            }
        }
    end,
    pools = {
        ["meme"] = true
    },
    cost = 8,
    weight = 0.18,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.meme))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.meme),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_meme', true, true, nil, nil)
    end
}
