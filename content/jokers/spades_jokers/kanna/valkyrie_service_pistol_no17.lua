SMODS.Joker {
    key = 'valkyrie_service_pistol_no17',
    loc_txt = {
        name = 'Valkyrie Service Pistol No.17',
        text = {'Played {C:attention}6{} of {V:1}spades{} can gain', '{E:1}seal, edition or enhancement{}',
                "{C:inactive}doesn't overrides{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_arm",
    cost = Kivolatro.arm_cost,
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
        x = 0,
        y = 4
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            local rank = context.other_card:get_id()
            if rank == 6 and context.other_card:is_suit("Spades", nil, true) then
                local _card = context.other_card
                Kivolatro.add_random_modifier(_card, "service_pistol", 1.5, 1.5, 1.5)
                card:juice_up()
                return {
                    message = "Bang!",
                    sound = Kivolatro.random_shot_sound(),
                    colour = G.C.RED
                }

            end
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker then
            return {
                message = "Reloading!",
                colour = HEX("ada8b5"),
                card = card,
                sound = Kivolatro.random_reload_sound()
            }
        end
    end
}
