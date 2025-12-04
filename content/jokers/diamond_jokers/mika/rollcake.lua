SMODS.Joker {
    key = 'rollcake',
    loc_txt = {
        name = 'Mika Special Chocolate Roll Cake',
        text = {'scored {C:attention}Queens{} of {s:G.C.SUITS.Diamonds}Diamonds{}',
                'Permanently gain +#1# {X:mult,C:white}mult{}'}
    },
    atlas = 'Diamonds_Jokers',
    rarity = "kivo_choco",
    cost = Kivolatro.choco_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 3,
        y = 10
    },
    soul_pos = {
        x = 1,
        y = 10
    },
    config = {
        extra = {
            perma_mult = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.perma_mult}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 12 and context.other_card:is_suit("Diamonds", nil, true) then
                context.other_card.ability.pperma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult +
                                                            card.ability.extra.perma_mult
            end
            return {
                extra = {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                },
                card = card
            }
        end
    end
}
