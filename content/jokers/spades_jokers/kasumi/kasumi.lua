-- Art:https://www.pixiv.net/en/artworks/130944027
SMODS.Joker {
    key = 'kasumi',
    loc_txt = {
        name = 'Kasumi',
        text = {'For every {C:attention}#2#{} cards {C:red}destroyed{}', 'Kasumi gains {X:mult,C:white}X#4#{} mult',
                "{C:inactive}Currently:{} {X:mult,C:white}X#3#{} {C:inactive}(#1#/#2#){} "}
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
        ["gehenna_students"] = true
    },
    pos = {
        x = 6,
        y = 1
    },
    soul_pos = {
        x = 2,
        y = 1
    },
    config = {
        extra = {
            destroyed = 0,
            needed = 4,
            xmult = 1,
            xmult_mod = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.destroyed, card.ability.extra.needed, card.ability.extra.xmult,
                    card.ability.extra.xmult_mod}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and card.ability.extra.xmult > 1 then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_xmult',
                    vars = {card.ability.extra.xmult}
                },
                Xmult_mod = card.ability.extra.xmult
            }
        end
        if not context.blueprint and not context.retrigger_joker and context.cards_destroyed or
            context.remove_playing_cards then
            card.ability.extra.tick = false
            for k, val in ipairs(context.removed) do
                if not context.blueprint then
                    card.ability.extra.destroyed = card.ability.extra.destroyed + 1
                    if card.ability.extra.destroyed >= card.ability.extra.needed then
                        card.ability.extra.destroyed = 0
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                        card.ability.extra.tick = true
                        return {
                            message = {"WAHAHA"},
                            sound = "kivo_kasumi",
                            colour = G.C.RED
                        }
                    end
                end
            end
        end
    end
}
