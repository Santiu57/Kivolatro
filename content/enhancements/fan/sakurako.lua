SMODS.Enhancement {
    key = "fan_sakurako",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Fan Card (Sakurako)",
        text = {"{X:mult,C:white}X#1#{} mult when score"}
    },
    pos = {
        x = 4,
        y = 0
    },
    config = {
        x_mult = 1.5
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.x_mult,
            }
        }
    end,
    calculate = function(self, card, context)
    end
}
