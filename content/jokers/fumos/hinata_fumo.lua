SMODS.Joker {
    key = 'hinata_fumo',
    loc_txt = {
        name = '{V:2}Hinata{} Fumo',
        text = {
            "{C:chips}+#2# chips{} per ",
            "{V:1}fumo joker{}" ,
            "{C:inactive}Fumos: #1#{}"
        }
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
        x = 2,
        y = 0
    },
    config = {
        extra = {
            fumos = 0,
            chips = 40
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.fumos,
                card.ability.extra.chips,
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.hinata)}
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.fumos = Kivolatro.fumo_count()
        if context.joker_main and context.cardarea == G.jokers then
            local chips = card.ability.extra.chips * card.ability.extra.fumos
            return {
                remove_default_message = true,
                message = localize {
                    type = 'variable',
                    key = "a_chips",
                    vars = {chips}
                },
                sound = 'kivo_hinata_fumo_sound',
                colour = HEX(Kivolatro.student_Colors.hinata),
                chips = chips
            }
        end
    end
}
