SMODS.Consumable {
    key = 'red_wave',
    set = 'waves',
    no_collection = true,
    loc_txt = Kivolatro.loc.boss_jokers.organ.red,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX("FF0000")}
            }
        }
    end
}
