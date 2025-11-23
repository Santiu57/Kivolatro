SMODS.Joker {
    key = 'im_coming',
    loc_txt = {
        name = 'Im cooming!!',
        text = {'{C:attention}+1{} {E:1}Joker{} slot', 'after #1# {C:attention}2{} of {V:1}Spades{} are scored',
                "{C:inactive}Amount needed increases by X5 each time{}", "{C:inactive}(Currently: #2#/#1#) {}"}
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
        y = 0
    },
    soul_pos = {
        x = 5,
        y = 0
    },
    config = {
        extra = {
            needed = 20,
            scored = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.max(card.ability.extra.needed, Kivolatro.miyu_meme_max),
                card.ability.extra.scored,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    remove_from_deck = function(self, card, from_debuff)
        Kivolatro.miyu_meme_max = card.ability.extra.needed
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if context.other_card:get_id() == 2 and context.other_card:is_suit("Spades", nil, true) then
                card.ability.extra.scored = card.ability.extra.scored + 1
                if card.ability.extra.scored == math.max(card.ability.extra.needed, Kivolatro.miyu_meme_max) then
                    card.ability.extra.scored = 0
                    card.ability.extra.needed = card.ability.extra.needed * 5
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    return {
                        message = "Cooming!!",
                        colour = HEX("ffffff"), -- white,
                        sound = "kivo_miyucom"
                    }
                end
            end
        end
    end
}
