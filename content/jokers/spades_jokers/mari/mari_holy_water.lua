SMODS.Joker {
    key = 'mari_holy_water',
    loc_txt = {
        name = '{V:2}Mari{} Holy Water',
        text = {'Scored {C:attention}4{} of {V:1}Spades{} give {X:gold,C:white}#1#${}',
                "per consecutive {C:attention}4{} scored", "increases by {X:gold,C:white}#2#${}",
                "{C:inactive}resets when a non 4 of spades scores{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_meme",
    cost = Kivolatro.meme_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 2
    },
    soul_pos = {
        x = 5,
        y = 2
    },
    config = {
        extra = {
            dollars = 0.5,
            dollars_mod = 0.25
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.dollars_mod,
                colours = {G.C.SUITS.Spades, HEX(Kivolatro.colors.mari)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 4 and context.other_card:is_suit("Spades", nil, true) then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_mod
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.dollar_buffer = 0
                        return true
                    end
                }))
                return {
                    chip_message = ("Blesed!"),
                    dollars = card.ability.extra.dollars,
                    color = G.C.GOLD,
                    card = card
                }
            else
                card.ability.extra.dollars = 0.5
            end
        end
    end
}
