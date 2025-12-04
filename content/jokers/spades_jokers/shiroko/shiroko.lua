SMODS.Joker {
    key = 'shiroko', -- Art:https://www.pixiv.net/en/artworks/130972341
    loc_txt = {
        name = 'Shiroko',
        text = {'{X:dark_edition,C:white} ^#2#{} Mult and {X:dark_edition,C:white} ^#1#{} Chips',
                'When a {C:attention}4{} of {s:G.C.SUITS.Spades}Spades {}Scores'}
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
        y = 11
    },
    soul_pos = {
        x = 2,
        y = 11
    },
    config = {
        extra = {
            power = 1.05,
            xpower = 1.1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card and card.ability.extra.power, card.ability.extra.xpower}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if context.other_card:get_id() == 4 and context.other_card:is_suit("Spades", nil, true) then
                return {
                    message = localize({
                        type = "variable",
                        key = "a_powchips",
                        vars = {card.ability.extra.power}
                    }),
                    localize({
                        type = "variable",
                        key = "a_powmult",
                        vars = {card.ability.extra.xpower}
                    }),
                    Echip_mod = (card.ability.extra.power),
                    Emult_mod = (card.ability.extra.xpower),
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end
}
