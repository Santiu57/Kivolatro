SMODS.Joker {
    key = 'shiroko_fumo',
    loc_txt = {
        name = '{V:2}Shiroko{} Fumo',
        text = {'WIP'}
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
        x = 8,
        y = 5
    },
    soul_pos = {
        x = 4,
        y = 2
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.fumo),HEX(Kivolatro.student_Colors.shiroko)}
            }
        }
    end,
    calculate = function(self, card, context)

    end
}
