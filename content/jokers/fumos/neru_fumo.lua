SMODS.Joker {
    key = 'neru_fumo',
    loc_txt = {
        name = '{V:2}Neru{} Fumo',
        text = {"WIP"}
    },
    atlas = 'fumo_atlas',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    pos = {
        x = Kivolatro.back_fumos.x,
        y = Kivolatro.back_fumos.y
    },
    soul_pos = {
        x = 4,
        y = 1
    },
    config = {
        extra = {
            fumos = 0,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.fumos,
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.neru)}
            }
        }
    end,
    calculate = function(self, card, context)

    end
}
