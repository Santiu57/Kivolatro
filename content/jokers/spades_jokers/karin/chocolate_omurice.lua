SMODS.Joker {
    key = 'chocolate_omurice',
    loc_txt = {
        name = 'Chocolate Omurice',
        text = {"Scored {V:1}spades{} gives {C:chips}+#1# chips{}", "scored {C:attention}5{} gives {C:mult}#2# mult{}",
                "If both, an extra {X:mult,C:white}X#3#{} mult"}
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
        y = 3
    },
    soul_pos = {
        x = 1,
        y = 3
    },
    config = {
        extra = {
            a_mult = 5,
            x_mult = 1.5,
            a_chips = 20
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.a_chips,
                card.ability.extra.a_mult,
                card.ability.extra.x_mult,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 5 and context.other_card:is_suit("Spades", nil, true) then
                return {
                    message = "Choco!",
                    colour = HEX(Kivolatro.colors.choco),
                    card = card,
                    mult = card.ability.extra.a_mult,
                    chips = card.ability.extra.a_chips,
                    x_mult = card.ability.extra.x_mult
                }
            else
                if context.other_card:get_id() == 5 then
                    return {
                        message = "Cho",
                        colour = HEX(Kivolatro.colors.choco),
                        card = card,
                        mult = card.ability.extra.a_mult
                    }
                else
                    if context.other_card:is_suit("Spades", nil, true) then
                        return {
                            message = "co!",
                            colour = HEX(Kivolatro.colors.choco),
                            card = card,
                            chips = card.ability.extra.a_chips
                        }
                    end
                end
            end
        end
    end
}
