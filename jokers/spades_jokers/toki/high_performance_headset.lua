SMODS.Joker {
    key = 'high_performance_headset',
    loc_txt = {
        name = 'High-Performance Headset',
        text = {'{V:1}Agent cards{} draws {C:attention}#1#{} additional cards',
                "{C:mult}+#2#{} mult per card in {C:attention}hand{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_item",
    cost = 6,
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
        x = 3,
        y = 7
    },
    config = {
        extra = {
            extra_draws = 1,
            mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_secret_e
        return {
            vars = {
                card.ability.extra.extra_draws,
                card.ability.extra.mult,
                colours = {HEX(Kivolatro.colors.agent)}
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        Kivolatro.extra_secret_draws = Kivolatro.extra_secret_draws + card.ability.extra.extra_draws
    end,
    remove_from_deck = function(self, card, from_debuff)
        Kivolatro.extra_secret_draws = Kivolatro.extra_secret_draws - card.ability.extra.extra_draws
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
