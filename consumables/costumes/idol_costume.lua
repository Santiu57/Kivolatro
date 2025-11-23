SMODS.Consumable {
    key = 'idol_costume',
    set = 'costumes',
    atlas = 'costumes',
    pos = {
        x = 0,
        y = 0
    },
    loc_txt = {
        name = "Idol Costume",
        text = {'Select {C:attention}#1#{} joker to change', 'its {V:1}Clothes{}', "{C:inactive}Change abilitys!{}"}
    },
    config = {
        extra = {
            max_highlighted = 1,
            student = ""
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_kivo_students_idols
        return {
            vars = {
                self.config.extra.max_highlighted,
                colours = {HEX(Kivolatro.colors.costume)}
            }
        }
    end,
    can_use = function(self, card, area, copier)
        for i = 1, #G.jokers.highlighted do
            if G.jokers.highlighted[i].config.center_key == "j_kivo_" .. Kivolatro.idol_costume_students[i] then
                self.config.extra.student = Kivolatro.idol_costume_students[i]
                return #G.jokers.highlighted == 1
            end
        end
    end,
    use = function(self, card)
        local check = false
        for i = 1, #G.jokers.highlighted do
            G.jokers.highlighted[i]:start_dissolve({HEX(Kivolatro.colors.costume)}, nil, 1.6)
            SMODS.add_card({
                set = 'Joker',
                key = 'j_kivo_' .. self.config.extra.student .. '_idol',
                edition = card.edition
            })
            return true
        end
    end
}
