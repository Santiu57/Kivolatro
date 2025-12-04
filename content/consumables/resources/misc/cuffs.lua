SMODS.Consumable {
    key = 'cuffs',
    set = 'resources',
    atlas = 'resources',
    pos = {
        x = 1,
        y = 6
    },
    loc_txt = {
        name = "Cuffs",
        text = {'Select {C:attention}#1#{} joker to give', '{C:purple}eternal sticker{}'}
    },
    config = {
        extra = {
            max_highlighted = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {self.config.extra.max_highlighted, self.config.extra.mult_mod}
        }
    end,
    can_use = function(self, card, area, copier)
        return #G.jokers.highlighted == 1
    end,
    use = function(self, card)
        local check = false
        for i = 1, #G.jokers.highlighted do
            G.jokers.highlighted[i].ability.eternal = true
            return true
        end
    end
}
