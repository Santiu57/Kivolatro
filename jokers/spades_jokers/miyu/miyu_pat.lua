SMODS.Joker {
    key = 'miyu_pat',
    loc_txt = {
        name = 'Miyu Pat',
        text = {'When round begins add a', "{C:attention}2{} of {V:1}Spades{} with random",
                "{E:1}seal, enhancement or edition{}"}
    },
    atlas = 'miyu_pat',
    rarity = "kivo_?",
    cost = Kivolatro.q_cost,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pos = {
        x = 0,
        y = 0
    },
    delay_sprites = 1,
    pixel_size = {
        w = 69 / 69 * 71,
        h = 50 / 50 * 71
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {G.C.SUITS.Spades}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local card = Kivolatro.add_playing_card("S", "2")
            Kivolatro.add_random_modifier(card, "pat_pat", 1, 1, 1)
        end
    end
}
