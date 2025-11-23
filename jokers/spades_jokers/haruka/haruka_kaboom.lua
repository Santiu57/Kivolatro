SMODS.Joker {
    key = 'haruka_kaboom',
    loc_txt = {
        name = 'Kaboom?',
        text = {"On every {C:blue}hand{} {X:mult,C:white}X#1#{}", "If {C:attention}boss blind{} isn't",
                "defeated on first {C:blue}hand{}", "{C:purple,E:1}Yes Haruka, kaboom!{}"}
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
        y = 6
    },
    soul_pos = {
        x = 5,
        y = 6
    },
    config = {
        extra = {
            xmult = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if G.GAME.blind.boss and G.GAME.current_round.hands_played == 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    play_sound('kivo_kaboom', 1, 2);
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Boom!",
                        colour = G.C.RED
                    });
                    return true
                end
            }))
            card.getting_sliced = true
            card:start_dissolve({G.C.PURPLE}, nil, 1.6)
            return true
        end
    end
}
