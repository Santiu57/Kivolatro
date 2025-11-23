SMODS.Joker {
    key = 'toki_bunny', -- https://x.com/fuyukey_/status/1934596825261998461
    loc_txt = {
        name = 'Toki Bunny',
        text = {"WIP"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student_costumes",
    cost = Kivolatro.students_cost,
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
        x = 7,
        y = 7
    },
    config = {
        extra = {
            mult = 1,
            mult_mod = 0.05
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_secret_e
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_mod,
                colours = {HEX(Kivolatro.colors.agent)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end
        if context.cardarea == G.play and context.individual and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, "m_kivo_secret_e") then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    extra = {
                        cardarea = card,
                        message = "Equipped!",
                        colour = HEX(Kivolatro.colors.agent)
                    }
                }
            end
        end
    end
}
