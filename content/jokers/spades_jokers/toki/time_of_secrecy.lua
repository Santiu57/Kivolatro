SMODS.Joker {
    key = 'time_of_secrecy',
    loc_txt = {
        name = 'Time of Secrecy',
        text = {'Played {C:blue}Bonus cards{} have', '{C:green}#1# in #2# chance{} to change', "into {V:1}agent cards{}"}
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
        y = 7
    },
    soul_pos = {
        x = 0,
        y = 7
    },
    config = {
        extra = {
            odds = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_secret_e
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, G.GAME.probabilities.normal,
            card.ability.extra.odds, 'time_of_Secrecy')
        return {
            vars = {
                new_numerator,
                new_denominator,
                colours = {HEX(Kivolatro.colors.agent)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if SMODS.has_enhancement(context.other_card, "m_bonus") then
                if SMODS.pseudorandom_probability(card, 'time_of_Secrecy', G.GAME.probabilities.normal,
                    card.ability.extra.odds, 'time_of_Secrecy') then
                    context.other_card:set_ability(G.P_CENTERS.m_kivo_secret_e)
                    context.other_card:juice_up()
                    return {
                        message = "Bang!",
                        sound = Kivolatro.random_shot_sound(),
                        colour = G.C.RED
                    }
                end
            end
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker then
            return {
                message = "Reloading!",
                colour = HEX("ada8b5"),
                card = card,
                sound = Kivolatro.random_reload_sound()
            }
        end
    end
}
