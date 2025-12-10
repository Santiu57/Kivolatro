SMODS.Joker {
    key = 'toki_fumo',
    loc_txt = {
        name = '{V:2}Toki{} Fumo',
        text = {"When {C:attention}skipping{} a blind", "Creates random {C:attention}tags{}",
                "by the number of {V:1}fumos{}", "{C:inactive}(Currently #1#){}"}
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
        x = 1,
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
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.toki)}
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.fumos = Kivolatro.fumo_count()
        if context.skip_blind and context.cardarea == G.jokers then
            for i = 1, card.ability.extra.fumos do
                Kivolatro.add_tag(Kivolatro.poll_tag("fumos", nil), nil, i < card.ability.extra.fumos)
            end
            return {
                message = "Fumos!",
                colour = HEX(Kivolatro.colors.fumo)
            }
        end
    end
}
