SMODS.Joker {
    key = 'yuuka_fumo',
    loc_txt = {
        name = 'Yuuka Fumo',
        text = {"WIP"}
    },
    atlas = 'fumo_atlas',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 2,
        y = 4
    },
    soul_pos = {
        x = 6,
        y = 1
    },
    config = {
        extra = {
            fumos = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.fumos,
                colours = {HEX(Kivolatro.colors.fumo)}
            }
        }
    end,
    calculate = function(self, card, context)

    end
}
