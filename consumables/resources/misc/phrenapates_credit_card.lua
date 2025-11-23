SMODS.Consumable {
    key = 'phrenapates_credit_card',
    set = 'resources',
    atlas = 'resources',
    hidden = true,
    soul_rate = 0.01,
    pos = {
        x = 4,
        y = 5
    },
    loc_txt = {
        name = "Phrenapate's Credit Card",
        text = {'Adds {V:1}Negative{} edition', 'to up to {C:attention}#1#{} selected cards',
                "{C:inactive}You really want to use it?{}"}
    },
    config = {
        extra = {
            max_highlighted = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {
            vars = {
                self.config.extra.max_highlighted,
                colours = {G.C.DARK_EDITION}
            }
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
    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            G.hand.highlighted[i]:set_edition({
                negative = true
            }, true)
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({
                    key = 'c_kivo_credit_card_shards',
                    key_append = 'obj'
                })
                G.GAME.consumeable_buffer = 0
                return true
            end
        }))
        card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = ("Pyro!"),
            colour = HEX("060d66")
        })
        return true
    end
}
