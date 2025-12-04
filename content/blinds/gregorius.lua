SMODS.Blind {
    key = "greg",
    loc_txt = Kivolatro.loc.boss_blinds.greg,
    atlas = "blinds",
    pos = {
        x = 0,
        y = 0
    },
    discovered = false,
    dollars = 7,
    mult = 5,
    boss_colour = HEX(Kivolatro.blinds_colors.greg),
    boss = {
        min = 1,
        showdown = false
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    set_blind = function(self)
        local organ = SMODS.add_card({
            key = "j_kivo_organ",
            key_append = "greg",
            no_edition = true
        })
        organ.ability.eternal = true
        G.GAME.blind.hands_sub = 3
        ease_hands_played(G.GAME.blind.hands_sub)
        return true
    end,
    disable = function(self)
        G.GAME.blind.chips = 600
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.HUD_blind:recalculate(Kivolatro.blinds_colors.greg)
    end,
    defeat = function(self)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.key == "j_kivo_organ" then
                G.jokers.cards[i]:start_dissolve({HEX(Kivolatro.blinds_colors.greg)}, nil, 1.6)
            end
        end
    end
}
