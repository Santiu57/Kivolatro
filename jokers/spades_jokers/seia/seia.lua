SMODS.Joker {
    key = 'seia', -- art:https://www.pixiv.net/en/artworks/131012717
    loc_txt = {
        name = 'Seia',
        text = {"After {C:attention}3{} rounds makes a", "random joker {V:1}negative{}", "{C:red,E:1}self destructs{}",
                "{C:inactive}(#1#/#2#){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 8
    },
    soul_pos = {
        x = 2,
        y = 8
    },
    config = {
        extra = {
            needed = 3,
            current = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.current,
                card.ability.extra.needed,
                colours = {G.C.DARK_EDITION}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local joker = Kivolatro.random_joker()
            if card.ability.extra.current == card.ability.extra.needed and #G.jokers.cards ~= 1 and
                Kivolatro.all_jokers_edition(card) == false then
                while joker == card or joker.edition do
                    joker = Kivolatro.random_joker()
                end
                card.ability.extra.current = 0
                joker:set_edition({
                    negative = true
                }, true)
                joker:juice_up()
                card:start_dissolve({HEX(Kivolatro.colors.trinity)}, nil, 1.6)
                return {
                    message = "Recovered!",
                    colour = HEX(Kivolatro.colors.trinity)
                }
            else
                if card.ability.extra.current < card.ability.extra.needed then
                    card.ability.extra.current = card.ability.extra.current + 1
                    return {
                        message = "Recovering!",
                        colour = HEX(Kivolatro.colors.trinity)
                    }
                else
                    return {
                        message = "No jokers!",
                        colour = HEX(Kivolatro.colors.trinity)
                    }
                end
            end
        end
    end
}
