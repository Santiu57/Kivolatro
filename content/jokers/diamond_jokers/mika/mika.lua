SMODS.Joker {
    key = 'mika', -- Art: pinterest.com/pin/1006976797921816974/
    loc_txt = {
        name = 'Mika',
        text = {"This joker gains {X:dark_edition,C:white} ^#2#{} Mult",
                "everytime a {C:attention}Queen{} of {s:G.C.SUITS.Diamond}diamonds{} Scores",
                "{C:inactive}(Currently{} {X:dark_edition,C:white} ^#1#{} {C:inactive}Mult){}"}
    },
    atlas = 'Diamonds_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 3,
        y = 10
    },
    soul_pos = {
        x = 2,
        y = 10
    },
    config = {
        extra = {
            power = 1,
            xpower = 0.005
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.power, card.ability.extra.xpower}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and not context.blueprint then
            if context.other_card:get_id() == 12 and context.other_card:is_suit("Diamonds", nil, true) then
                card.ability.extra.power = ((card.ability.extra.power) + card.ability.extra.xpower)
                return {
                    message = localize("k_upgrade_ex"),
                    card = card,
                    colour = G.C.DARK_EDITION
                }
            end
        end
        if context.joker_main and ((card.ability.extra.power) > (1)) then
            return {
                message = localize({
                    type = "variable",
                    key = "a_powmult",
                    vars = {(card.ability.extra.power)}
                }),
                Emult_mod = (card.ability.extra.power),
                colour = G.C.DARK_EDITION
            }
        end
    end
}
