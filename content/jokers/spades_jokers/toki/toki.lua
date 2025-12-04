SMODS.Joker {
    key = 'toki', -- https://www.pixiv.net/en/artworks/105988409
    loc_txt = {
        name = 'Toki',
        text = {"Toki gains {X:mult,C:white}X#2#{} per", "{V:1}agent card{} scored",
                "{C:inactive}Currently {}{X:mult,C:white}X#1#{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
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
        x = 2,
        y = 7
    },
    config = {
        extra = {
            mult = 1,
            mult_mod = 0.05,
            noise = false
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_secret_e
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_mod,
                card.ability.extra.noise,
                colours = {HEX(Kivolatro.colors.agent)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.individual and not context.blueprint and not context.retrigger_joker then
                if SMODS.has_enhancement(context.other_card, "m_kivo_secret_e") then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                    card.ability.extra.noise = true
                    return {}
                end
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end
        if context.after and card.ability.extra.noise == true and not context.blueprint and not context.retrigger_joker then
            return {
                message = "Peace, peace!",
                colour = HEX(Kivolatro.colors.agent),
                sound = "kivo_toki_peace"
            }
        end
        if context.before and not context.blueprint and not context.retrigger_joker then
            card.ability.extra.noise = false
        end
    end
}
