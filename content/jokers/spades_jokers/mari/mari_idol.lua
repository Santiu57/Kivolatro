SMODS.Joker {
    key = 'mari_idol', -- forgot to put a link
    loc_txt = {
        name = '{V:1}Mari{} Idol',
        text = {'If any {C:blue}hand{} has {C:attention}1{} card', 'makes it a {V:2}fan card{},',
                "{V:2}fan cards{} each give", "{X:mult,C:white}X#1#{} {C:mult}mult{}"}
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
        x = 7,
        y = 2
    },
    config = {
        extra = {
            mult = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_fan_mari
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_fan_sakurako
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kivo_fan_mine
        return {
            vars = {
                card.ability.extra.mult,
                colours = {HEX(Kivolatro.student_Colors.mari), HEX(Kivolatro.colors.resource)}
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
                    message = "If my song can make Sensei happy... ",
                    colour = HEX(Kivolatro.student_Colors.mari)
                })
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "There's nothing more I can ask for.",
                    colour = HEX(Kivolatro.student_Colors.mari)
                })
                return true
            end
        }))
        play_sound("kivo_mari_idol_sound")
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.pool_flags.mari_can_spawn = true
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            for i = 1, 3 do
                if SMODS.has_enhancement(context.other_card, "m_kivo_fan_" .. i) then
                    return {
                        Xmult = card.ability.extra.mult
                    }
                end
            end
        end
        if context.cardarea == G.play and context.individual and not context.blueprint and not context.retrigger_joker then
            if #context.full_hand == 1 then
                context.full_hand[1]:set_ability((G.P_CENTERS.m_kivo_fan_mari))
                return {
                    message = "Idol!",
                    colour = HEX(Kivolatro.student_Colors.mari)
                }
            end
        end
    end
}
