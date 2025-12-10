SMODS.Joker {
    key = 'saori_fumo',
    loc_txt = {
        name = 'Saori Fumo',
        text = {'WIP'}
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
        x = 3,
        y = 3
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                "Spade",
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)

    end
}
