SMODS.Consumable {
    key = 'yellow_wave',
    set = 'waves',
    no_collection = true,
    loc_txt = Kivolatro.loc.boss_jokers.organ.yellow,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX("FFFF00")}
            }
        }
    end
}
