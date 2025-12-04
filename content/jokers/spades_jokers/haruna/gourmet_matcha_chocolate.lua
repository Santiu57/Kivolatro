SMODS.Joker {
    key = 'gourmet_matcha_chocolate',
    loc_txt = {
        name = 'Gourmet Matcha Chocolate',
        text = {'{E:1,C:green}Retrigger{} {V:1}chocolate jokers{}', "{C:attention}#1#{} aditional times"}
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
        y = 5
    },
    soul_pos = {
        x = 1,
        y = 5
    },
    config = {
        extra = {
            retriggers = 1
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.retriggers,
                colours = {HEX(Kivolatro.colors.choco)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
            if context.other_card.config.center.rarity == "kivo_choco" then
                return {
                    message = "Again!",
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            else
                return nil, true
            end
        end
    end
}
