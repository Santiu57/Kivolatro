SMODS.Joker {
    key = 'toki_fumo',
    loc_txt = {
        name = 'Toki Fumo',
        text = {"When {C:attention}skipping{} a blind", "Creates random {C:attention}tags{}",
                "by the number of {V:1}fumos{}", "{C:inactive}(Currently #1#){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 7
    },
    soul_pos = {
        x = 4,
        y = 7
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
