SMODS.Tag {
    atlas = "kivo_tags",
    pos = {
        x = 2,
        y = 0
    },
    key = "arm_tag",
    min_ante = 1,
    loc_txt = {
        name = "Arm tag",
        text = {"Shop has a free", "{V:1}Arm Joker{}"}
    },
    loc_vars = function(self, info_queue)
        return {
            vars = {
                colours = {HEX(Kivolatro.colors.arm)}
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local card = SMODS.create_card {
                set = "Joker",
                rarity = "kivo_arm",
                area = context.area,
                key_append = "kivo_uta"
            }
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', HEX(Kivolatro.colors.student), function()
                card:start_materialize()
                card.ability.couponed = true
                card:set_cost()
                return true
            end)
            tag.triggered = true
            return card
        end
    end
}
