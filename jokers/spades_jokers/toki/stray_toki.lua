SMODS.Joker {
    key = 'stray_toki', -- https://www.pixiv.net/en/artworks/105585547
    loc_txt = {
        name = 'Stray Toki',
        text = {"{X:mult,C:white}X#1#{} and creates", "{C:attention}#2#{} random consumables",
                "but loses {C:gold}#3# dollars{}", "at the {C:attention}end of round{}",
                "{C:inactive}(Must have room){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_meme",
    cost = Kivolatro.meme_cost,
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
        x = 5,
        y = 7
    },
    config = {
        extra = {
            xmult = 1.5,
            consumables = 2,
            gold = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.consumables, card.ability.extra.gold}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            for i = 1, card.ability.extra.consumables do
                Kivolatro.random_consumable()
            end
            return {
                message = "Slacking!",
                colour = HEX(Kivolatro.colors.agent),
                dollars = -card.ability.extra.gold,
                card = card
            }
        end
    end
}
