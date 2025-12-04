SMODS.Joker {
    key = 'seia_drift',
    loc_txt = {
        name = 'Seia Drift',
        text = {"WIP"}
    },
    atlas = 'Seia_Drift_atlas',
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
        h = 71
    },
    config = {
        extra = {
            name = Kivolatro.music.duration
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {Kivolatro.music.duration, Kivolatro.music.music, Kivolatro.k}
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.name = Kivolatro.music.duration
    end,
    calculate = function(self, card, context)
        card.ability.extra.name = Kivolatro.music.duration
    end
}
