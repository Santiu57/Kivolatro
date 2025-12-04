SMODS.Joker {
    key = 'big_eye',
    loc_txt = {
        name = 'Big Eye',
        text = {"If played {C:blue}hand{} is a {C:attention}#4#{}", "and a {C:attention}5{} of {V:1}spades{} scores",
                "{C:mult}+#1#{}, {C:chips}+#3#{} and {X:mult,C:white}X#2#{}", "{C:inactive}Change at the end of round{}"}
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
        y = 3
    },
    soul_pos = {
        x = 0,
        y = 3
    },
    config = {
        extra = {
            a_mult = 30,
            x_mult = 5,
            a_chips = 100,
            type = "High Card",
            iscard = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.a_mult,
                card.ability.extra.x_mult,
                card.ability.extra.a_chips,
                localize(card.ability.extra.type, "poker_hands"),
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.type = Kivolatro.random_hand("big_eye")
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and not context.blueprint and context.individual then
            local rank = context.other_card:get_id()
            if rank == 5 and context.other_card:is_suit("Spades", nil, true) then
                card.ability.extra.iscard = true
                return {
                    message = {"Aim!"},
                    colour = HEX(Kivolatro.colors.resource)
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.iscard == true then
                if context.scoring_name == card.ability.extra.type then
                    card.ability.extra.iscard = false
                    return {
                        remove_default_message = true,
                        mult = card.ability.extra.a_mult,
                        chips = card.ability.extra.a_chips,
                        x_mult = card.ability.extra.x_mult,
                        message = "Bang!",
                        sound = Kivolatro.random_shot_sound(),
                        colour = G.C.RED,
                        card = card
                    }
                end
            end
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker then
            card.ability.extra.type = Kivolatro.random_hand("big_eye")
            return {
                message = "Reloading!",
                colour = HEX("ada8b5"),
                card = card,
                sound = Kivolatro.random_reload_sound()
            }
        end
    end
}
