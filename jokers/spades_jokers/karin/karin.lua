SMODS.Joker { -- Art:https://www.pixiv.net/en/artworks/126799587
    key = 'karin',
    loc_txt = {
        name = 'Karin',
        text = {"Every {C:yellow}blind{} increases by {C:attention}#3#{}", "after {C:attention}defeating{} blinds",
                "{C:attention}Karin gains {X:mult,C:white}X#2#{}",
                "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {
        ["millennium_students"] = true
    },
    pos = {
        x = 6,
        y = 3
    },
    soul_pos = {
        x = 2,
        y = 3
    },
    config = {
        extra = {
            Extra_size = 2,
            Xmult = 1,
            xmult_mod = 0.25
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xmult, card.ability.extra.xmult_mod, card.ability.extra.Extra_size}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.Xmult
            }
        end
        if context.setting_blind and not context.blueprint and not card.getting_sliced then
            G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.Extra_size
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.HUD_blind:recalculate()
            return {
                message = "I dont miss!",
                colour = G.C.PURPLE,
                sound = "kivo_karin"
            }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.xmult_mod
        end
    end
}
