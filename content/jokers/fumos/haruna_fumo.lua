SMODS.Joker {
    key = 'haruna_fumo',
    loc_txt = {
        name = 'Haruna Fumo',
        text = {'Every {C:attention}#1#{} {C:green}rerolls{} adds', "the {C:blue}planet{} card of",
                'your most {C:attention}played hand{}', "{C:inactive}(Currently #2#/#1#){}",
                "{C:inactive}Must have room{}"}
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
        y = 5
    },
    soul_pos = {
        x = 4,
        y = 5
    },
    config = {
        extra = {
            needed = 2,
            rerolls = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.needed,
                card.ability.extra.rerolls,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop then
            card.ability.extra.rerolls = card.ability.extra.rerolls + 1
            if card.ability.extra.rerolls == card.ability.extra.needed then
                card.ability.extra.rerolls = 0
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    local name = Kivolatro.most_played_hand()
                    local card = create_card("planet", G.consumeables, nil, nil, nil, nil, name, "fumo")
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    return true
                end
            end
        end
    end
}
