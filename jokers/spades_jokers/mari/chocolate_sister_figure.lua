SMODS.Joker {
    key = 'chocolate_sister_figure',
    loc_txt = {
        name = 'Chocolate Sister Figure',
        text = {'First card of played {C:blue}hand{}', "is {V:1}Blessed{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_choco",
    cost = Kivolatro.choco_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 2
    },
    soul_pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_bless
        return {
            vars = {
                "Spade",
                colours = {HEX(Kivolatro.colors.blessed)}
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.cardarea == G.play) and context.other_card == context.full_hand[1] and not context.blueprint and
            not context.retrigger_joker then
            context.full_hand[1]:set_ability(G.P_CENTERS.m_kivo_bless)
            return {
                message = ("Choco!"),
                colour = HEX(Kivolatro.colors.choco),
                card = card
            }
        end
    end
}
