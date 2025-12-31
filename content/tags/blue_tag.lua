SMODS.Tag {
    atlas = "kivo_tags",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        type = "store_joker_modify",
        edition = "kivo_blue_edition"
    },
    key = "blue_tag",
    requires = "e_kivo_blue_edition",
    min_ante = 1,
    loc_txt = {
        name = "Blue tag",
        text = {"Next base edition shop", "Joker is free and", "becomes {V:1}Blue{}"}
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_kivo_blue_edition
        return {
            vars = {
                "blue",
                colours = {HEX(Kivolatro.colors.blue)}
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == "store_joker_modify" then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep("+", G.C.DARK_EDITION, function()
                    context.card:set_edition({
                        kivo_blue_edition = true
                    }, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
            end
        end
    end
}
