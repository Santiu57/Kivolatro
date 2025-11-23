SMODS.Joker {
    key = 'mariuoh',
    loc_txt = {
        name = 'Uoohh',
        text = {'{C:red}Destroy{} every {C:attention}scored{} card', "That isn't a {C:attention}4{} of {V:1}Spades{}"}
    },
    atlas = 'mariuoh',
    rarity = "kivo_?",
    cost = Kivolatro.q_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pos = {
        x = 0,
        y = 0
    },
    delay_sprites = 1,
    pixel_size = {
        w = 71,
        h = 50
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
        if context.destroying_card and not context.blueprint then
            if context.destroying_card:get_id() == 4 and context.destroying_card:is_suit("Spades", nil, true) then
                card = card
            else
                if context.destroy_card then
                    return {
                        remove = true,
                        message = ("UOHH")
                    }
                end
                if context.after then
                    play_sound('kivo_uohsound', 1, 0.1)
                end
            end
        end
    end
}
