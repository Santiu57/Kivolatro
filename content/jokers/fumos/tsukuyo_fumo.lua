SMODS.Joker {
    key = 'tsukuyo_fumo',
    loc_txt = {
        name = '{V:2}Tsukuyo{} Fumo',
        text = {"WIP"}
    },
    atlas = 'fumo_atlas',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 8,
        y = 5
    },
    soul_pos = {
        x = 7,
        y = 4
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
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.tsukuyo)}
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.fumos = Kivolatro.fumo_count()
    end
}
