SMODS.Shader({
    key = 'blue',
    path = 'blue.fs'
}) -- shader from Cryptid (astral but blue)

SMODS.Edition {
    key = "blue_edition",
    loc_txt = {
        name = "Blue",
        label = "Blue Edition",
        text = {"{E:2,C:green}Retrigger{} the {C:attention}card{}", "{C:attention}#1#{} aditional times"}
    },
    shader = "blue",
    discovered = true,
    unlocked = true,
    config = {
        retriggers = 2
    },
    in_shop = true,
    weight = 2,
    extra_cost = 6,
    apply_to_float = true,
    badge_colour = HEX(Kivolatro.colors.blue),
    sound = {
        sound = "kivo_blue_sound",
        per = 1,
        vol = 0.25
    },
    loc_vars = function(self, card)
        return {
            vars = {self.config.retriggers, card}
        }
    end,
    calculate = function(self, card, context)
        if context.other_card == card and
            ((context.repetition and context.cardarea == G.play) or
                (context.retrigger_joker_check and not context.retrigger_joker)) then
            return {
                repetitions = self.config.retriggers,
                card = card
            }
        end
    end
}
