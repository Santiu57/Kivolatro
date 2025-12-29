SMODS.Enhancement {
    key = "fan_mine",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Fan Card (Mine)",
        text = {"{X:chips,C:white}X#1#{} chips when score"}
    },
    pos = {
        x = 3,
        y = 0
    },
    config = {
        x_chips = 1.5
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.x_chips}
        }
    end,
    calculate = function(self, card, context)
    end
}
