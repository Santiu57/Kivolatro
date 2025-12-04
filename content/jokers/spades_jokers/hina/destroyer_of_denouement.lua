SMODS.Joker {
    key = 'destroyer_of_denouement',
    loc_txt = {
        name = 'Destroyer of Denouement',
        text = {'WIP'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_arm",
    cost = Kivolatro.arm_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 12
    },
    soul_pos = {
        x = 0,
        y = 12
    },
    config = {
        extra = {
            xmult = 1.2,
            xchips = 1.3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.xchips}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            local rank = context.other_card:get_id()
            if rank == 4 and context.other_card:is_suit("Spades", nil, true) then
                return {
                    x_mult = lenient_bignum(card.ability.extra.xmult),
                    x_chips = lenient_bignum(card.ability.extra.xchips),
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    end
}
