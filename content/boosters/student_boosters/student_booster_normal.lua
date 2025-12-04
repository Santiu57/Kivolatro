SMODS.Booster {
    key = "student_booster_normal",
    kind = "Student",
    atlas = "boosters",
    group_key = "student_boosters",
    loc_txt = Kivolatro.loc.buffoon_pack.student,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = 3,
        choose = 1,
        name = "Student pack"
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.config.center.config.choose,
                card.ability.extra,
                "Student",
                colours = {HEX(Kivolatro.colors.student)}
            }
        }
    end,
    pools = {
        ["student"] = true
    },
    cost = 5,
    weight = 0.35,
    draw_hand = false,
    unlocked = true,
    discovered = true,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX(Kivolatro.colors.student))
        ease_background_colour({
            new_colour = HEX(Kivolatro.colors.student),
            special_colour = G.C.BLACK,
            contrast = 2
        })
    end,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, 'kivo_student', true, true, nil, nil)
    end
}
