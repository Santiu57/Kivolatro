SMODS.Joker { -- https://safebooru.org/index.php?page=post&s=view&id=5009872
    key = 'ugh',
    loc_txt = {
        name = 'Ugh',
        text = {'If first {C:blue}hand{} of {C:attention}round{}', 'has one {C:attention}3{} of {V:1}Spades{}',
                "{C:red}destroy it{} and creates", "a random {V:2}student joker{}", "{C:inactive}(Must have room){}"}
    },
    atlas = 'Spades_Jokers',
    rarity = "kivo_meme",
    cost = Kivolatro.meme_cost,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {
        x = 6,
        y = 1
    },
    soul_pos = {
        x = 5,
        y = 1
    },
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {G.C.SUITS.Spades, HEX(Kivolatro.colors.student)}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.destroying_card and context.cardarea == G.play and not context.blueprint then
            if #context.full_hand == 1 then
                if G.GAME.current_round.hands_played == 0 and context.destroying_card:get_id() == 3 and
                    context.destroying_card:is_suit("Spades", nil, true) then
                    if #G.jokers.cards + 1 <= G.jokers.config.card_limit then
                        local card = create_card("Joker", G.jokers, nil, "kivo_student", nil, nil, nil, "kivo_ugh")
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        if not context.retrigger_joker then
                            return {
                                remove = true,
                                message = ("T_T"),
                                sound = "kivo_kasumi_ugh",
                                colour = G.C.BLUE
                            }
                        end
                    end
                else
                    card = card
                end
            end
        end
    end
}
