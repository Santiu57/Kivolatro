SMODS.Joker {
    key = 'haruka_fumo',
    loc_txt = {
        name = '{V:2}Haruka{} Fumo',
        text = {"Every {C:attention}#2#{} {C:inactive}[#3#]{} blinds", "Creates {C:purple}Tarot cards{}",
                "by the {C:attention}number{} of {V:1}fumo{}", "{V:1}jokers{} on possesion",
                "{C:inactive}(Currently #1#){}"}
    },
    atlas = 'fumo_atlas',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 8,
        y = 5
    },
    soul_pos = {
        x = 0,
        y = 2
    },
    config = {
        extra = {
            fumos = 0,
            needed = 2,
            blinds = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.fumos,
                card.ability.extra.needed,
                card.ability.extra.blinds,
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.haruka)}
            }
        }
    end,
    calculate = function(self, card, context)
        local fumos = Kivolatro.fumo_count()
        card.ability.extra.fumos = fumos
        if card.ability.extra.blinds == card.ability.extra.needed and context.end_of_round then
            card.ability.extra.blinds = 0
            for i = 1, fumos do
                local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'fumo')
                card:add_to_deck()
                G.consumeables:emplace(card)
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('card1');
                    return true
                end
            }))
            delay(0.05)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = "Fumos!",
                colour = G.C.PURPLE
            })
            return true
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.blinds = card.ability.extra.blinds + 1
        end
    end
}
