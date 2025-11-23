SMODS.Consumable {
    key = 'students_idols',
    set = 'costumes_descs',
    loc_txt = Kivolatro.loc.costumes_students.idol,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.mari_color), HEX(Kivolatro.colors.Kivolatro.colors.gehena),
                           HEX(Kivolatro.colors.Kivolatro.colors.millennium)}
            }
        }
    end
}
