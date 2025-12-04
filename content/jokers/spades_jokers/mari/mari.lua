SMODS.Joker { -- Art:https://danbooru.donmai.us/posts/7272483
    key = 'mari',
    loc_txt = {
        name = '{V:1}Mari{}',
        text = {'{C:attention}Quadruplicates{} all {C:green}probabilities{}',
                '{C:inactive}(ex: {}{C:green}1 in 2{} {C:inactive}->{} {C:green}4 in 2{}{C:inactive}){}'}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = {
        ["trinity_students"] = true
    },
    pos = {
        x = 6,
        y = 2
    },
    soul_pos = {
        x = 2,
        y = 2
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.mari)}
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        self.added_to_deck = true
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "Grace be with you.",
                    colour = HEX(Kivolatro.colors.mari)
                })
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "I pray you have a nice day today.",
                    colour = HEX(Kivolatro.colors.mari)
                })
                return true
            end
        }))
        play_sound("kivo_mari_sound")
    end,
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint and not context.retrigger_joker then
            return {
                numerator = context.numerator * 4
            }
        end
    end
}
