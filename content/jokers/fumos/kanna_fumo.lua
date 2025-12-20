SMODS.Joker {
    key = 'kanna_fumo',
    loc_txt = {
        name = '{V:2}Kanna{} Fumo',
        text = {'Next {C:green}shop{} has', 'an extra {C:attention}free{} {V:1}school pack{}',
                "after defeat a {C:attention}boss blind{}"}
    },
    atlas = 'fumo_atlas',
    rarity = "kivo_fumo",
    cost = Kivolatro.fumo_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    pos = {
        x = Kivolatro.back_fumos.x,
        y = Kivolatro.back_fumos.y
    },
    soul_pos = {
        x = 0,
        y = 3
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_desc_school_packs
        return {
            vars = {
                colours = {Kivolatro.schools_gradient, HEX(Kivolatro.student_Colors.kanna)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.starting_shop and card.ability.triggered then
            card.ability.triggered = false
            -- Adds a free booster to the shop
            local booster_type = pseudorandom(pseudoseed('fumo'))
            local school = "p_kivo_trinity_booster"
            if booster_type > 0 and booster_type < 0.2 then
                school = "p_kivo_trinity_booster"
            elseif booster_type > 0.2 and booster_type < 0.4 then
                school = "p_kivo_gehenna_booster"
            elseif booster_type > 0.4 and booster_type < 0.6 then
                school = "p_kivo_china_booster"
            elseif booster_type > 0.6 and booster_type < 0.8 then
                school = "p_kivo_misc_booster"
            elseif booster_type > 0.8 and booster_type < 1 then
                school = "p_kivo_millennium_booster"
            end
            Kivolatro.add_booster(school, 0)
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            card.ability.triggered = true
        end
    end
}
