SMODS.Joker {
    key = 'seia_chocolate',
    loc_txt = {
        name = "Seia's Booby-Trapped Chocolate",
        text = {'WIP'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_choco",
    cost = Kivolatro.choco_cost,
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
        x = 1,
        y = 8
    },
    config = {
        extra = {
            name = nil
        },
        immutable = {
            max_retriggers = 40
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.name}
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.name = G.ARGS.push.desired_track
    end
}
