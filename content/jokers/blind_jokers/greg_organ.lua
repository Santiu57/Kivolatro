SMODS.Joker {
    key = 'organ',
    loc_txt = Kivolatro.loc.boss_jokers.organ,
    atlas = 'boss_jokers',
    rarity = "kivo_boss_rarity",
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    no_collection = true,
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            wave = "Yellow",
            facing = "You",
            debuffed_key = nil,
            already_discarted = false,
            activated = false,
            remaining_hands = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_yellow_wave
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_blue_wave
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_red_wave
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_green_wave
        return {
            vars = {
                card.ability.extra.wave,
                card.ability.extra.facing,
                colours = {HEX(Kivolatro.wave_color)}
            }
        }
    end,
    calculate = function(self, card, context)
        local body = card.ability.extra
        Kivolatro.right_wave_color(body.wave)
        if context.pre_discard and body.already_discarted == false then
            local sprite = 1
            local no_2_change = false
            if body.facing == "Gregorius" and no_2_change == false then
                body.facing = "You"
                no_2_change = true
                sprite = 1
            end
            if body.facing == "You" and no_2_change == false then
                body.facing = "Gregorius"
                no_2_change = true
                sprite = 0
            end
            body.already_discarted = true
            card:flip()
            G.P_CENTERS.j_kivo_organ.pos.x = sprite
            card:flip()
            return {
                message = "Fliped!",
                colour = HEX(Kivolatro.blinds_colors.greg),
                sound = "tarot1"
            }
        end
        if context.before and body.wave == "Yellow" and body.activated == false then
            local joker = Kivolatro.random_joker()
            if #G.jokers.cards ~= 1 then
                while joker == card do
                    joker = Kivolatro.random_joker()
                end
            end
            if #G.jokers.cards == 1 then
                body.activated = true
                body.wave = "Blue"
                return {
                    message = "No jokers!",
                    colour = HEX(Kivolatro.blinds_colors.greg)
                }
            else
                if joker ~= card then
                    joker:set_debuff(true)
                    body.wave = "Blue"
                    body.activated = true
                    body.debuffed_key = joker.config.center.key
                    return {
                        message = "Debuffed!",
                        colour = HEX(Kivolatro.blinds_colors.greg)
                    }
                end
            end
        end
        if body.wave == "Blue" and body.activated == false then
            if context.before and body.facing == "Gregorius" then
                G.GAME.blind.chips = G.GAME.blind.chips * 0.5
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate(Kivolatro.blinds_colors.greg)
                body.wave = "Red"
                body.activated = true
                return {
                    message = "Debuffed!",
                    colour = HEX(Kivolatro.blinds_colors.greg)
                }
            end
            if context.joker_main and body.facing == "You" then
                body.wave = "Red"
                body.activated = true
                return {
                    Xmult = 0.5
                }
            end
        end
        if body.wave == "Red" and body.activated == false and context.before then
            G.GAME.blind.chips = G.GAME.blind.chips * 1.25
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.HUD_blind:recalculate(Kivolatro.blinds_colors.greg)
            body.wave = "Green"
            body.activated = true
            return {
                message = "Buffed!",
                colour = HEX(Kivolatro.blinds_colors.greg)
            }
        end
        if body.wave == "Green" and body.activated == false then
            if context.before and body.facing == "Gregorius" then
                G.GAME.blind.chips = G.GAME.blind.chips * 1.5
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate(Kivolatro.blinds_colors.greg)
                body.wave = "Yellow"
                body.activated = true
                return {
                    message = "Buffed!",
                    colour = HEX(Kivolatro.blinds_colors.greg)
                }
            end
            if context.joker_main and body.facing == "You" then
                body.wave = "Yellow"
                body.activated = true
                return {
                    Xmult = 1.5
                }
            end
        end
        if context.after then
            body.already_discarted = false
            body.activated = false
            if body.debuffed_key then
                if body.remaining_hands == 0 then
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key == body.debuffed_key then
                            G.jokers.cards[i]:set_debuff(false)
                            body.remaining_hands = 1
                        end
                    end
                else
                    body.remaining_hands = body.remaining_hands - 1
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}
