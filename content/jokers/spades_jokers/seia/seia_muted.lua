SMODS.Joker {
    key = 'seia_muted',
    loc_txt = {
        name = 'Muted',
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
        y = 8
    },
    soul_pos = {
        x = 5,
        y = 8
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.xchips}
        }
    end,
    calculate = function(self, card, context)
    end
}
