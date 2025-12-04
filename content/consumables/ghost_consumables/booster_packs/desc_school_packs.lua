SMODS.Consumable {
    key = 'desc_school_packs',
    set = 'boosters_descs',
    loc_txt = Kivolatro.loc.misc.school.packs,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.trinity), HEX(Kivolatro.colors.gehena),
                           HEX(Kivolatro.colors.millennium), HEX(Kivolatro.colors.student),
                           HEX(Kivolatro.colors.shanhaijing), HEX(Kivolatro.colors.hyakkiyako)}
            }
        }
    end
}
