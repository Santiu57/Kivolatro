SMODS.Joker {
    key = 'karin_fumo', -- a bit broken with blue edition or duplicates
    loc_txt = {
        name = '{V:2}Karin{} Fumo',
        text = {"Divides the {C:attention}needed score{}", "by the {C:attention}number{} of {V:1}fumo{}",
                "{V:1}jokers{} on possesion", "{C:inactive}(Currently #1#){}"}
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
        x = 0,
        y = 1
    },
    config = {
        extra = {
            fumos = 0,
            div = 1,
            fumocount = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.fumos,
                colours = {HEX(Kivolatro.colors.fumo), HEX(Kivolatro.student_Colors.karin)}
            }
        }
    end,
    calculate = function(self, card, context)
        local fumos = Kivolatro.fumo_count()
        if context.setting_blind and not context.blueprint and not card.getting_sliced then
            G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.div
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.HUD_blind:recalculate()
            return {
                message = "Fumos!",
                colour = HEX(Kivolatro.colors.fumo)
            }
        end
        card.ability.extra.fumos = fumos
        card.ability.extra.div = 1
        card.ability.extra.div = card.ability.extra.div / fumos
    end
}
