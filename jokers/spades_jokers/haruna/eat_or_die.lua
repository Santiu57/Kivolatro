SMODS.Joker {
    key = 'eat_or_die', -- https://www.reddit.com/r/BlueArchive/comments/yraa21/eat_or_die_haruna_by_uhouhogorigoli/
    loc_txt = {
        name = '{C:red}Eat{} or Die',
        text = {"Apply {V:2}negative{} edition", "to the {C:attention}right{} joker",
                "at the {C:attention}end of round{}", "if its a {V:1}choco joker{}",
                "{C:green}#1# in #2# chance{} to {C:red,E:1,s:1.2}Die{}"}
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
        y = 5
    },
    soul_pos = {
        x = 5,
        y = 5
    },
    config = {
        extra = {
            odds = 50
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, G.GAME.probabilities.normal,
            card.ability.extra.odds, 'eat_or_die')
        return {
            vars = {
                new_numerator,
                new_denominator,
                colours = {HEX(Kivolatro.colors.choco), G.C.DARK_EDITION}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker then
            if SMODS.pseudorandom_probability(card, 'eat_or_die', G.GAME.probabilities.normal, card.ability.extra.odds,
                'eat_or_die') then
                if G.STAGE == G.STAGES.RUN then
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                end
            else
                G:save_progress()
            end
            -- Apply negative if didnt die
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                end
            end
            if Kivolatro.safe_get(G, "jokers") then
                if my_pos and G.jokers.cards[my_pos + 1] and G.jokers.cards[my_pos + 1].config.center.rarity ==
                    "kivo_choco" then
                    G.jokers.cards[my_pos + 1]:set_edition({
                        negative = true
                    }, true)
                end
            end
        end
    end
}
