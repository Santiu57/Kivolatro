-- https://www.pixiv.net/en/artworks/128944937
SMODS.Joker {
    key = 'haruka',
    loc_txt = {
        name = 'Haruka',
        text = {'Disable effects of every {C:attention}blind{}', "{C:red}Destroy{} every {V:1}student joker{}",
                "{C:inactive}not herself,{} {C:inactive,E:1,s:0.8}hopefully{}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_student",
    cost = Kivolatro.student_cost,
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
        x = 2,
        y = 6
    },
    config = {},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.student)}
            }
        }
    end,
    calculate = function(self, card, context)
        local make_noise = false
        local random_noise = math.random(Kivolatro.haruka_noises)
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
            end
        end
        if context.setting_blind then
            G.GAME.blind:disable()
            return {
                message = Kivolatro.haruka_voicelines[random_noise],
                sound = Kivolatro.haruka_sound(random_noise),
                colour = G.C.PURPLE
            }
        end
        if context.end_of_round and context.cardarea == G.jokers or context.ending_shop then
            if Kivolatro.safe_get(G, "jokers") then
                for i = 1, #G.jokers.cards do
                    if Kivolatro.isStudent(G.jokers.cards[i].config.center.rarity) and my_pos ~= i and
                        not Kivolatro.isPs68(G.jokers.cards[i].config.center.key) then
                        local sliced_card = G.jokers.cards[i]
                        make_noise = true
                        sliced_card.getting_sliced = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({HEX(Kivolatro.colors.student)}, nil, 1.6)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                end
                if make_noise == true then
                    return {
                        message = Kivolatro.haruka_voicelines[random_noise],
                        sound = Kivolatro.haruka_sound(random_noise),
                        colour = G.C.PURPLE
                    }
                end
            end
        end
    end
}
