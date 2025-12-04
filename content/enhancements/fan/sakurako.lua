SMODS.Enhancement {
    key = "fan_sakurako",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Fan Card (Sakurako)",
        text = {"{X:mult,C:white}X#1#{} mult when score"}
    },
    pos = {
        x = 3,
        y = 0
    },
    config = {
        x_mult = 1.2
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.mult,
                colours = {HEX(Kivolatro.colors.mari)}
            }
        }
    end,
    calculate = function(self, card, context)
    end
}
