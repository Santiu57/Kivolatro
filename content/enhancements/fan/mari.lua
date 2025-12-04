SMODS.Enhancement {
    key = "fan_mari",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Fan Card ({V:1}Mari{})",
        text = {"{X:chips,C:white}X#1#{} chips when score", "{X:mult,C:white}X#2#{} mult when score"}
    },
    pos = {
        x = 2,
        y = 0
    },
    config = {
        x_chips = 1.1,
        x_mult = 1.1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.chips,
                card.ability.mult,
                colours = {HEX(Kivolatro.colors.mari)}
            }
        }
    end,
    calculate = function(self, card, context)
    end
}
