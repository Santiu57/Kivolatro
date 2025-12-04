SMODS.Enhancement {
    key = "fan_mine",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Fan Card (Mine)",
        text = {"{X:chips,C:white}X#1#{} chips when score"}
    },
    pos = {
        x = 4,
        y = 0
    },
    config = {
        x_chips = 1.2
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.chips}
        }
    end,
    calculate = function(self, card, context)
    end
}
