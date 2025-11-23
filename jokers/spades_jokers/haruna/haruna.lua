-- Art:https://www.pixiv.net/en/artworks/127651519
SMODS.Joker {
    key = 'haruna',
    loc_txt = {
        name = 'Haruna',
        text = {'{C:attention}Haruna{} gains {X:mult,C:white} X#2#{} for each', "{V:1}chocolate joker{} in possesion",
                "at the end of round", "{C:inactive}(Currently{} {X:mult,C:white}X#1#{}{C:inactive}){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 5
    },
    soul_pos = {
        x = 2,
        y = 5
    },
    config = {
        extra = {
            xmult = 1,
            mod = 0.1,
            chocos = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.mod,
                colours = {HEX(Kivolatro.colors.choco)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.chocos = 0
            if Kivolatro.safe_get(G, "jokers") then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.rarity == "kivo_choco" then
                        card.ability.extra.chocos = card.ability.extra.chocos + 1
                    end
                end
                card.ability.extra.xmult = card.ability.extra.xmult +
                                               (card.ability.extra.mod * card.ability.extra.chocos)
                return {
                    message = "Mm!",
                    sound = "kivo_haruna_mm",
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}
