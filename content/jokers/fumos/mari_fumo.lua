SMODS.Joker {
    key = 'mari_fumo',
    loc_txt = {
        name = '{V:2}Mari{} Fumo',
        text = {"at the {C:attention}end of round{}", "{C:gold}+#1#${} dollars for each",
                "{V:1}fumo joker{} in possession", "{C:inactive}Fumos: #2#{}"}
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
        x = 0,
        y = 0
    },
    config = {
        extra = {
            dollars = 4,
            fumos = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.fumos,
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.mari)}
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.fumos = Kivolatro.fumo_count()
        if context.end_of_round and context.cardarea == G.jokers then
            return {
                dollars = card.ability.extra.dollars * card.ability.extra.fumos,
                remove_default_message = true,
                message = "+"..card.ability.extra.dollars * card.ability.extra.fumos.."$",
                sound = 'kivo_mari_fumo_sound',
                colour = HEX(Kivolatro.student_Colors.mari),
            }
        end
    end
}
