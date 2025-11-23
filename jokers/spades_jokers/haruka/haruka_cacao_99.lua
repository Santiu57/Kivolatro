SMODS.Joker {
    key = 'haruka_cacao_99',
    loc_txt = {
        name = 'Cacao 99.99%',
        text = {'Scored cards on {C:attention}second{}', "{C:blue}hand{} of round", "converts into {V:1}choco cards{}"}
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
        y = 6
    },
    soul_pos = {
        x = 1,
        y = 6
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_choco_e
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.choco)}
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.cardarea == G.play) and G.GAME.current_round.hands_played == 1 and not context.blueprint and
            not context.retrigger_joker and context.individual then
            context.other_card:set_ability(G.P_CENTERS.m_kivo_choco_e)
            context.other_card:juice_up()
            return {
                message = ("Choco!"),
                colour = HEX(Kivolatro.colors.choco),
                card = card
            }
        end
    end
}
