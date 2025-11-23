SMODS.Joker {
    key = 'neat_white_corsage',
    loc_txt = {
        name = 'Neat White Corsage',
        text = {'{E:1,C:green}Retrigger{} all {C:attention}4{} of {V:1}Spades{}', '{C:attention}#1#{} additional times'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_item",
    cost = Kivolatro.item_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 2
    },
    soul_pos = {
        x = 3,
        y = 2
    },
    config = {
        extra = {
            retriggers = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 4 and context.other_card:is_suit("Spades", nil, true) then
                return {
                    repetitions = (card.ability.extra.retriggers),
                    card = card
                }
            end
        end
    end
}
