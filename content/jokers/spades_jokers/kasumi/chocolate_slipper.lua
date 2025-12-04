SMODS.Joker {
    key = 'chocolate_slipper',
    loc_txt = {
        name = 'Chocolate Slipper',
        text = {'{E:1,C:attention}Creates{} a {C:attention}Hang man{} card',
                'When #2# {C:attention}3{} of {V:1}Spades{} Scores', "{C:inactive}(Currently #1#/#2#){}",
                "{C:inactive}(Must have room){}"}
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
        y = 1
    },
    soul_pos = {
        x = 1,
        y = 1
    },
    config = {
        extra = {
            cards_scored = 0,
            cards_needed = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_hanged_man
        return {
            vars = {
                colours = {G.C.SUITS.Spades},
                card.ability.extra.cards_scored,
                card.ability.extra.cards_needed
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            local rank = context.other_card:get_id()
            if rank == 3 and context.other_card:is_suit("Spades", nil, true) then
                card.ability.extra.cards_scored = card.ability.extra.cards_scored + 1
                if card.ability.extra.cards_scored >= card.ability.extra.cards_needed then
                    card.ability.extra.cards_scored = 0
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({
                                    key = 'c_hanged_man',
                                    key_append = 'ojb'
                                })
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = "Choco!",
                            colour = HEX(Kivolatro.colors.choco)
                        })
                        return true
                    end
                end
            end
        end
    end
}
