SMODS.Joker {
    key = 'chocolate_bark',
    loc_txt = {
        name = 'Chocolate Bark',
        text = {'{E:1}Scored{} {C:attention}2{} of {V:1}Spades{}',
                'on first {C:blue}hand{} of {C:attention}round{} gains',
                "{C:mult}+#1# mult{} {C:chips}+#2# chips{} {X:mult,C:white}X#3#{} {X:chips,C:white}X#4#{} {C:gold}+#5#$"}
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
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            mult = 0.5,
            chips = 1,
            xmult = 0.01,
            xchips = 0.005,
            dollars = 0.2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.xmult,
                card.ability.extra.xchips,
                card.ability.extra.dollars,
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if G.GAME.current_round.hands_played == 0 and G.play then
                local rank = context.other_card:get_id()
                if rank == 2 and context.other_card:is_suit("Spades", nil, true) then
                    if context.other_card:get_id() == 2 and context.other_card:is_suit("Spades", nil, true) then
                        local body = context.other_card.ability
                        body.perma_bonus = body.perma_bonus or 0
                        body.perma_bonus = body.perma_bonus + card.ability.extra.chips

                        body.perma_mult = body.perma_mult or 0
                        body.perma_mult = body.perma_mult + card.ability.extra.mult

                        body.perma_x_chips = body.perma_x_chips or 0
                        body.perma_x_chips = body.perma_x_chips + card.ability.extra.xchips

                        body.perma_x_mult = body.perma_x_mult or 0
                        body.perma_x_mult = body.perma_x_mult + card.ability.extra.xmult

                        body.perma_p_dollars = body.perma_p_dollars or 0
                        body.perma_p_dollars = body.perma_p_dollars + card.ability.extra.dollars
                        return {
                            message = ("Choco!"),
                            colour = HEX(Kivolatro.colors.choco),
                            card = card
                        }
                    end
                end
            end
        end
    end
}
