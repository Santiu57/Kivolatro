SMODS.Consumable {
    key = 'advanced_fusion_keystone',
    set = 'resources',
    atlas = 'resources',
    pos = {
        x = 2,
        y = 4
    },
    loc_txt = {
        name = 'Advanced Fusion Keystone',
        text = {"Select {C:attention}#1#{} card to", "{C:attention}permanently{} give {X:gold,C:white}+#2#${}",
                "when the card {C:attention}score{}"}
    },
    config = {
        extra = {
            max_highlighted = 1,
            dollars_mod = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {self.config.extra.max_highlighted, self.config.extra.dollars_mod}
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
            color = G.C.GOLD,
            bonus_key = 'perma_p_dollars',
            bonus_value = self.config.extra.dollars_mod,
            extra_juice = {0.3, 0.4},
            dollar = true
        })
    end
}
