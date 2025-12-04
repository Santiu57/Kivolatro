SMODS.Joker {
    key = 'red_rector',
    loc_txt = {
        name = 'Red Rector',
        text = {'{C:red}Destroy{} all scored cards', 'On {C:attention}final{} {C:blue}hand{} of round',
                '{C:inactive}Cant destroy Aces or 3 of spades{}'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_arm",
    cost = Kivolatro.arm_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 1
    },
    soul_pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.destroying_card and not context.blueprint then
            if G.GAME.current_round.hands_left ~= 0 or context.destroying_card:get_id() == 14 and
                context.destroying_card:is_suit("Spades", nil, true) or G.GAME.current_round.hands_left ~= 0 or
                context.destroying_card:get_id() == 3 and context.destroying_card:is_suit("Spades", nil, true) then
                card = card
            else
                if context.destroy_card then
                    return {
                        remove = true,
                        message = ("Bang"),
                        sound = Kivolatro.random_shot_sound(),
                        colour = G.C.RED
                    }
                end
            end
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker then
            return {
                message = "Reloading!",
                colour = HEX("ada8b5"),
                card = card,
                sound = Kivolatro.random_reload_sound()
            }
        end
    end
}
