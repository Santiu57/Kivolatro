SMODS.Joker {
    key = 'sad_bunny_thermos',
    loc_txt = {
        name = 'Sad Bunny Thermos',
        text = {'{E:1,C:green}Retrigger{} all {C:attention}2{} of {V:1}Spades{} {C:attention}#3#{} additional times',
                'Increases by 1 after #1# {C:attention}2{} of {V:1}Spades{} are played',
                "{C:inactive}Amount needed increases by X4 each time{}", "{C:inactive}(Currently #2#/#1#){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_item",
    cost = Kivolatro.item_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {
        x = 6,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = {
            needed = 2,
            scored = 0,
            retriggers = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.needed,
                card.ability.extra.scored,
                card.ability.extra.retriggers,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    remove_from_deck = function(self, card, from_debuff)
        Kivolatro.miyu_termo_max = card.ability.extra.needed
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 2 and context.other_card:is_suit("Spades", nil, true) then
                card.ability.extra.scored = card.ability.extra.scored + 1
                if card.ability.extra.scored == card.ability.extra.needed then
                    card.ability.extra.scored = 0
                    card.ability.extra.needed = card.ability.extra.needed * 4
                    card.ability.extra.retriggers = card.ability.extra.retriggers + 1
                end
                return {
                    message = ("T_T"),
                    repetitions = (card.ability.extra.retriggers),
                    card = card
                }
            end
        end
    end
}
