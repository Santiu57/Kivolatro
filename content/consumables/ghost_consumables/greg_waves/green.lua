SMODS.Consumable {
    key = 'green_wave',
    set = 'waves',
    no_collection = true,
    loc_txt = Kivolatro.loc.boss_jokers.organ.green,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX("00FF00")}
            }
        }
    end
}
