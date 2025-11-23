SMODS.Enhancement {
    key = "choco_e",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Choco Card",
        text = {"{C:chips}+#3#{} bonus chips", "{C:green}#1# in #2# chance{} to {C:attention}melt{}"}
    },
    pos = {
        x = 1,
        y = 0
    },
    config = {
        bonus = 100,
        odds = 3
    },
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, G.GAME.probabilities.normal,
            card.ability.odds, 'choco')
        return {
            vars = {new_numerator, new_denominator, card.ability.bonus}
        }
    end,
    calculate = function(self, card, context)
        if Kivolatro.can_melt then
            card.ability.odds = 3
            if context.destroying_card and not context.blueprint then
                if context.destroying_card == card and
                    SMODS.pseudorandom_probability(card, 'choco', G.GAME.probabilities.normal, card.ability.odds,
                        'choco') then
                    if context.destroy_card then
                        return {
                            remove = true,
                            message = ("Melted!"),
                            sound = "tarot1",
                            colour = HEX(Kivolatro.colors.choco)
                        }
                    end
                else
                    card = card
                end
            end
        end
        if not Kivolatro.can_melt then
            card.ability.odds = "infinity"
        end
    end
}
