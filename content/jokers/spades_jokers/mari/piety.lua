SMODS.Joker {
    key = 'piety',
    loc_txt = {
        name = 'Piety',
        text = {'Scored {V:1}Blessed cards{}', 'each give {X:mult,C:white}X#1#{} Mult'}
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
        y = 2
    },
    soul_pos = {
        x = 0,
        y = 2
    },
    config = {
        extra = {
            xmult = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_bless
        return {
            vars = {
                card.ability.extra.xmult,
                colours = {HEX(Kivolatro.colors.blessed)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, "m_kivo_bless") and not context.end_of_round then
            return {
                remove_default_message = true,
                Xmult = (card.ability.extra.xmult),
                message = "Bang!",
                sound = Kivolatro.random_shot_sound(),
                colour = G.C.RED,
                card = card
            }
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
