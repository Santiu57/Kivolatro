SMODS.Consumable {
    key = 'novice_activity_report',
    set = 'resources',
    atlas = 'resources',
    pos = {
        x = 0,
        y = 0
    },
    loc_txt = {
        name = 'Novice Activity Report',
        text = {"Select {C:attention}#1#{} card to",
                "{C:attention}permanently{} give {X:chips,C:white}+#2#{} {C:chips}chips{}",
                "when the card {C:attention}score{}"}
    },
    config = {
        extra = {
            max_highlighted = 1,
            chip_mod = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {self.config.extra.max_highlighted, self.config.extra.chip_mod}
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
            message_key = 'a_chips',
            color = G.C.CHIPS,
            bonus_key = 'perma_bonus',
            bonus_value = self.config.extra.chip_mod,
            extra_juice = {0.3, 0.4}
        })
    end
}
