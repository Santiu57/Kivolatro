SMODS.Consumable {
    key = 'advanced_tactical_training_blu-ray',
    set = 'resources',
    atlas = 'resources',
    pos = {
        x = 2,
        y = 3
    },
    loc_txt = {
        name = 'Advanced Tactical Training Blu-ray',
        text = {"Select {C:attention}#1#{} card to",
                "{C:attention}permanently{} give {X:mult,C:white}X#2#{} {C:mult}mult{}",
                "when the card {C:attention}score{}"}
    },
    config = {
        extra = {
            max_highlighted = 1,
            mult_mod = 0.25
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {self.config.extra.max_highlighted, self.config.extra.mult_mod}
        }
    end,
    can_use = function(self, card, area, copier)
        if G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            if G.hand and G.hand.highlighted then
                return card.ability.extra.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= 1
            end
        end
        return false
    end,
    use = function(self, card)
        Kivolatro.apply_bonus_to_highlighted({
            message_key = 'a_xmult',
            color = G.C.MULT,
            bonus_key = 'perma_x_mult',
            bonus_value = self.config.extra.mult_mod,
            extra_juice = {0.3, 0.4}
        })
    end
}
