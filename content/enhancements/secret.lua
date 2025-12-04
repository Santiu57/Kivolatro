SMODS.Enhancement {
    key = "secret_e",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Agent Card",
        text = {"{C:chips}+#1#{} extra chips", "Draws {C:attention}#2#{} extra cards", "on first {C:blue}hand{} drawn",
                "if card is {C:attention}drawed{}"}
    },
    pos = {
        x = 5,
        y = 0
    },
    config = {
        bonus = 20,
        extra_cards = 1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.bonus, card.ability.extra_cards + Kivolatro.extra_secret_draws}
        }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and context.cardarea == G.hand then
            G.FUNCS.draw_from_deck_to_hand(card.ability.extra_cards + Kivolatro.extra_secret_draws)
        end
    end
}
