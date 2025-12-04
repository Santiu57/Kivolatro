SMODS.Consumable {
    key = 'blue_wave',
    set = 'waves',
    no_collection = true,
    loc_txt = Kivolatro.loc.boss_jokers.organ.blue,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX("0000FF")}
            }
        }
    end
}
