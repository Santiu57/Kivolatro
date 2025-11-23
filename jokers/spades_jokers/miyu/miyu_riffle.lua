SMODS.Joker {
    key = 'miyu_riffle',
    loc_txt = {
        name = 'RABBIT Type 39 Rifle',
        text = {'{E:1}Creates{} a {V:2}Resource{} card', 'When #2# {C:attention}2{} of {V:1}Spades{} Scores',
                "{C:inactive}(Currently #1#/#2#){}", "{C:inactive}(Must have room){}"}
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
        y = 0
    },
    soul_pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            cards_scored = 0,
            cards_needed = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {G.C.SUITS.Spades, HEX(Kivolatro.colors.resource)},
                card.ability.extra.cards_scored,
                card.ability.extra.cards_needed
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            local rank = context.other_card:get_id()
            if rank == 2 and context.other_card:is_suit("Spades", nil, true) then
                card.ability.extra.cards_scored = card.ability.extra.cards_scored + 1
                if card.ability.extra.cards_scored == card.ability.extra.cards_needed then
                    card.ability.extra.cards_scored = 0
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        local card = create_card('resources', G.Consumeables, nil, nil, nil, nil, nil)
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        return {
                            message = {"Bang!"},
                            sound = Kivolatro.random_shot_sound(),
                            colour = HEX("fc2626")
                        }
                    end
                else
                    if not context.retrigger_joker then
                        return {
                            message = "Reloading!",
                            colour = HEX("ada8b5"),
                            card = card,
                            sound = Kivolatro.random_reload_sound()
                        }
                    end
                end
            end
        end
    end
}
