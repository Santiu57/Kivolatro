SMODS.Joker {
    key = 'quis_ut_deus',
    loc_txt = {
        name = 'Quis ut Deus',
        text = {"This joker gains {X:mult,C:white}X#2#{} Mult",
                "everytime a {C:attention}Queen{} of {s:G.C.SUITS.Diamond}diamonds{} Scores",
                "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"}
    },
    atlas = 'Diamonds_Jokers',
    rarity = "kivo_arm",
    cost = Kivolatro.arm_cost,
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
        x = 0,
        y = 10
    },
    config = {
        extra = {
            xmult = 1,
            xmult_mod = 0.05
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.xmult_mod}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and not context.blueprint then
            if context.other_card:get_id() == 12 and context.other_card:is_suit("Diamonds", nil, true) then
                card.ability.extra.xmult = ((card.ability.extra.xmult) + card.ability.extra.xmult_mod)
                return {
                    message = localize("k_upgrade_ex"),
                    card = card,
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main and ((card.ability.extra.xmult) > (1)) then
            return {
                message = localize({
                    type = "variable",
                    key = "a_xmult",
                    vars = {(card.ability.extra.xmult)}
                }),
                Xmult_mod = (card.ability.extra.xmult),
                colour = G.C.MULT
            }
        end
    end
}
