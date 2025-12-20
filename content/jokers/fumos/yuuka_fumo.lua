SMODS.Joker {
    key = 'yuuka_fumo',
    loc_txt = {
        name = '{V:2}Yuuka{} Fumo',
        text = {"+1 {C:mult} mult {} per Fumo you own."}
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
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.yuuka)}
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.fumos = Kivolatro.fumo_count()
        if context.joker_main then
            return {
                mult = card.ability.extra.fumos
            }
        end
    end
}
