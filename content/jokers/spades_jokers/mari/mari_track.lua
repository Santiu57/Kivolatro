SMODS.Joker {
    key = 'mari_track', -- https://www.pixiv.net/en/artworks/128930986
    loc_txt = {
        name = '{V:1}Mari{} Track',
        text = {'{E:1,C:green}Retrigger{} {V:2}Student jokers{}', '{C:attention}#1#{} aditional times'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student_costumes",
    cost = Kivolatro.student_cost,
    unlocked = true,
    hidden = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {
        ["student_costumes"] = true
    },
    pos = {
        x = 6,
        y = 2
    },
    soul_pos = {
        x = 8,
        y = 2
    },
    config = {
        extra = {
            retriggers = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers,
                colours = {HEX(Kivolatro.student_Colors.mari), HEX(Kivolatro.colors.student)}
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        self.added_to_deck = true
        G.GAME.pool_flags.mari_can_spawn = false
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "I will do my best.",
                    colour = HEX(Kivolatro.student_Colors.mari)
                })
                return true
            end
        }))
        play_sound("kivo_mari_track_sound")
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.pool_flags.mari_can_spawn = true
    end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
            if context.other_card.config.center.rarity == "kivo_student" then
                return {
                    message = "Again!",
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            else
                return nil, true
            end
        end
    end
}
