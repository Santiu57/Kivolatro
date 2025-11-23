-- Art:https://mx.pinterest.com/pin/805792558358989975/
SMODS.Joker {
    key = 'kanna',
    loc_txt = {
        name = 'Kanna',
        text = {"At the end", "of {C:green}shop{}, creates", "some {V:1}cuffs{}"}
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
        y = 4
    },
    soul_pos = {
        x = 2,
        y = 4
    },
    pools = {
        ["misc_students"] = true
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_cuffs
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.resource)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                card:juice_up()
                SMODS.add_card({
                    key = 'c_kivo_cuffs',
                    key_append = 'resource'
                })
                return true
            end
        end
    end
}
