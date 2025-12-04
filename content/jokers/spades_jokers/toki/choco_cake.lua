SMODS.Joker {
    key = 'choco_cake',
    loc_txt = {
        name = 'Best, Greatest, Ultimate Homemade Chocolate Cake',
        text = {"{V:1}Choco cards{} give", "{C:chips}+#1#{} extra chips", "and not longer {C:attention}melt's{}"}
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
        y = 7
    },
    soul_pos = {
        x = 1,
        y = 7
    },
    config = {
        extra = {
            chips = 50
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_choco_e
        return {
            vars = {
                card.ability.extra.chips,
                colours = {HEX(Kivolatro.colors.choco)}
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        Kivolatro.can_melt = false
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not next(find_joker("j_kivo_choco_cake")) then
            Kivolatro.can_melt = true
        end
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if SMODS.has_enhancement(context.other_card, "m_kivo_choco_e") then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
