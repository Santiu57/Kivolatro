SMODS.Joker {
    key = 'sakurako_fumo',
    loc_txt = {
        name = '{V:2}Sakurako{} Fumo',
        text = {
        "Multiplies your", 
        "{V:1}Fumos count{} by {C:attention}2{}.",
        "{C:inactive}(Fumos: #1#){}"
    }
    },
    atlas = 'fumo_atlas',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 8,
        y = 5
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            fumos = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.fumos,
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.sakurako)}
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('kivo_sakurako_fumo_sound');
                    return true
                end
            }))
            delay(0.05)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = "Grace be upon you all",
                colour = HEX(Kivolatro.student_Colors.sakurako)
            })
    end,
    calculate = function(self, card, context)
        card.ability.extra.fumos = Kivolatro.fumo_count()
    end
}
