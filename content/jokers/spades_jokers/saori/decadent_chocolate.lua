SMODS.Joker {
    key = 'decadent_chocolate',
    loc_txt = {
        name = "Decadent Chocolate",
        text = {'Retrigger all {C:attention}4{} of {s:G.C.SUITS.Spades}Spades{} {C:attention}#1#{} additional times'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_choco",
    cost = Kivolatro.choco_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 9
    },
    soul_pos = {
        x = 1,
        y = 9
    },
    config = {
        extra = {
            retriggers = 2
        },
        immutable = {
            max_retriggers = 40
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {math.min(center.ability.immutable.max_retriggers, center.ability.extra.retriggers)}
        }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 4 and context.other_card:is_suit("Spades", nil, true) then
                return {
                    message = localize("k_again_ex"),
                    repetitions = to_number(math.min(card.ability.immutable.max_retriggers,
                        card.ability.extra.retriggers)),
                    card = card
                }
            end
        end
    end
}
