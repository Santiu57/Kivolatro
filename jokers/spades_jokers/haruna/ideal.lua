SMODS.Joker {
    key = 'ideal',
    loc_txt = {
        name = 'Ideal',
        text = {'{C:green}levels up{} the winning', 'hand by the amount', "of scored {C:attention}7{} of {V:1}spades{}",
                "on this {C:attention}round{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_arm",
    cost = Kivolatro.arm_cost,
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
        x = 0,
        y = 5
    },
    config = {
        extra = {
            levels = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.levels,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            local rank = context.other_card:get_id()
            if rank == 7 and context.other_card:is_suit("Spades", nil, true) then
                card.ability.extra.levels = card.ability.extra.levels + 1
                if not context.retrigger_joker then
                    return {
                        message = "Reloading!",
                        colour = HEX("ada8b5"),
                        sound = Kivolatro.random_reload_sound()
                    }
                end
            end
        end
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.levels ~= 0 then
                return {
                    level_up = card.ability.extra.levels,
                    message = "Bang!",
                    sound = Kivolatro.random_shot_sound(),
                    colour = G.C.RED
                }
            end
        end
        if context.setting_blind then
            card.ability.extra.levels = 0
        end
    end
}
