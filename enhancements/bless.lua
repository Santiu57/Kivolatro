SMODS.Enhancement {
    key = "bless",
    atlas = "kivo_enhancements",
    loc_txt = {
        name = "Blessed Card",
        text = {"{X:gold,C:white}+#1#${} when scored"}
    },
    pos = {
        x = 0,
        y = 0
    },
    config = {
        dollars = 3
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.dollars}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                p_dollars = card.ability.dollars
            }
        end
    end
}
