SMODS.Joker {
    key = 'sharp_Illumination',
    loc_txt = {
        name = 'Sharp Illumination',
        text = {'WIP'}
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
        y = 8
    },
    soul_pos = {
        x = 0,
        y = 8
    },
    config = {
        extra = {
            value = 1.2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.xchips}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local mypose = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    mypose = i
                end
            end
            if G.jokers.cards[mypose + 1] then
                Kivolatro.multiply_extras(G.jokers.cards[mypose + 1], card.ability.extra.value)
                return {
                    message = "Illuminated!",
                    colour = HEX(Kivolatro.colors.trinity),
                    sound = Kivolatro.random_shot_sound()
                }
            end
        end
        if context.end_of_round and not context.retrigger_joker and context.cardarea == G.jokers then
            return {
                message = "Reloading!",
                colour = HEX("ada8b5"),
                sound = Kivolatro.random_reload_sound()
            }
        end
    end
}
