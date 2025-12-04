SMODS.Joker {
    key = 'its_fine',
    loc_txt = {
        name = 'This is fine',
        text = {"{V:1}Fire Arms{} each", "give {X:mult,C:white}X#1#{} mult"}
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
        y = 4
    },
    soul_pos = {
        x = 5,
        y = 4
    },
    config = {
        extra = {
            xmult = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                colours = {HEX(Kivolatro.colors.arm)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker then
            if Kivolatro.safe_get(G, "jokers") then
                if context.other_joker.config.center.rarity == "kivo_arm" then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end
}
