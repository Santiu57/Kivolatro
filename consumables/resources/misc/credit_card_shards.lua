SMODS.Consumable {
    key = "credit_card_shards",
    set = 'resources',
    atlas = 'resources',
    hidden = true,
    soul_rate = 0,
    pos = {
        x = 0,
        y = 6
    },
    loc_txt = {
        name = "Credit Card Shards",
        text = {"{V:1,E:1}Remnants of Phrenapate's credit card.{}",
                "{V:1,E:1}Very few people remember its original appearance.{}"}
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.max_highlighted,
                colours = {HEX("2E2221")}
            }
        }
    end,
    can_use = function(self, card, area, copier)
        return true
    end,
    use = function(self, card, area, copier)
        local newcard = create_card('resources', G.consumeables)
        newcard:add_to_deck()
        G.consumeables:emplace(newcard)
    end
}
