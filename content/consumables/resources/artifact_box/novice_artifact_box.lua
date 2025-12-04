SMODS.Consumable {
    key = 'novice_artifact_box', -- key
    set = 'resources', -- the set of the card: corresponds to a consumable type
    atlas = 'resources', -- atlas
    pos = {
        x = 0,
        y = 1
    }, -- position in atlas
    loc_txt = {
        name = 'Novice Atifact Box', -- name of card
        text = { -- text of card
        "Select {C:attention}#1#{} card to", "{C:attention}permanently{} give {X:mult,C:white}+#2#{} {C:mult}mult{}",
        "when the card {C:attention}score{}"}
    },
    config = {
        extra = {
            max_highlighted = 1,
            mult_mod = 3
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
            message_key = 'a_mult',
            color = G.C.MULT,
            bonus_key = 'perma_mult',
            bonus_value = self.config.extra.mult_mod,
            extra_juice = {0.3, 0.4}
        })
    end
}
