SMODS.Joker {
    key = 'karin_stare',
    loc_txt = {
        name = '-_-',
        text = {"+#1# {C:attention}hand size{}", "after oneshoting any {C:attention}blind{}",
                "{C:inactive}Self destructs{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_meme",
    cost = Kivolatro.meme_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 3
    },
    soul_pos = {
        x = 5,
        y = 3
    },
    config = {
        hand_size = 1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.hand_size}
        }
    end,
    calculate = function(self, card, context)
        if context.after and SMODS.last_hand_oneshot and not context.individual and context.cardarea == G.jokers then
            destruct = true
            G.hand:change_size(card.ability.hand_size)
            G.E_MANAGER:add_event(Event({
                func = function()
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true
                        end
                    }))
                    return true
                end
            }))
            return {
                message = "Blacked",
                colour = HEX("000000")
            }
        end
    end
}
