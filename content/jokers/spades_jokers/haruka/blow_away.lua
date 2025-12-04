SMODS.Joker {
    key = 'blow_away',
    loc_txt = {
        name = 'Blow Away',
        text = {"At the end of {C:green}shop{}", 'if the left joker is', "a {V:1}student{}, {C:red}destroy it{}",
                "and gain {C:attention}0.2{} of its", "sell value as {X:mult,C:white}xm{}",
                "{C:inactive}(Currently{} {X:mult,C:white}X#1#{}{C:inactive}){}"}
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
        y = 6
    },
    soul_pos = {
        x = 0,
        y = 6
    },
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                colours = {HEX(Kivolatro.colors.student)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.ending_shop and not context.blueprint and not card.getting_sliced then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                end
            end
            if Kivolatro.safe_get(G, "jokers") then
                if my_pos and G.jokers.cards[my_pos - 1].config.center.rarity == "kivo_student" then
                    if not self.getting_sliced and not G.jokers.cards[my_pos - 1].ability.eternal and
                        not G.jokers.cards[my_pos - 1].getting_sliced then
                        local sliced_card = G.jokers.cards[my_pos - 1]
                        sliced_card.getting_sliced = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.joker_buffer = 0
                                card.ability.extra.xmult = card.ability.extra.xmult + sliced_card.sell_cost * 0.2
                                card:juice_up(0.8, 0.8)
                                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                                play_sound(Kivolatro.random_shot_sound(), 0.96 + math.random() * 0.08)
                                return true
                            end
                        }))
                    end
                end
            end
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker then
            return {
                message = "Reloading!",
                colour = HEX("ada8b5"),
                sound = Kivolatro.random_reload_sound()
            }
        end
    end
}
