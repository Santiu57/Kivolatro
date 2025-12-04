SMODS.Joker {
    key = 'an_everyday_coffee',
    loc_txt = {
        name = 'An Everyday Coffee',
        text = {'played {V:1}spade{} cards with', "{E:1}edition{} will {C:attention}create{}",
                "a {V:2}chocolate joker{}", "{C:inactive}(Must have room){}"}
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
        y = 4
    },
    soul_pos = {
        x = 1,
        y = 4
    },
    config = {},
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                colours = {G.C.SUITS.Spades, HEX(Kivolatro.colors.choco)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if context.other_card:is_suit("Spades", nil, true) and context.other_card.edition then
                if #G.jokers.cards + 1 <= G.jokers.config.card_limit then
                    local card = create_card("Joker", G.jokers, nil, "kivo_choco", nil, nil, nil, "kivo_coffee")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return {
                        message = "Choco!",
                        colour = HEX(Kivolatro.colors.choco),
                        card = card
                    }
                end
            end
        end
    end
}
