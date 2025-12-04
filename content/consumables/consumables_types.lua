-- resources
SMODS.ConsumableType {
    key = 'resources', -- consumable type key
    collection_rows = {4, 4}, -- amount of cards in one page
    primary_colour = HEX(Kivolatro.colors.resource),
    secondary_colour = HEX(Kivolatro.colors.resource),
    loc_txt = {
        collection = 'Resources', -- name displayed in collection
        name = 'Resources', -- name displayed in badge
        undiscovered = {
            name = 'Unknown resource', -- undiscovered name
            text = {'Who knows what it does?'} -- undiscovered text
        }
    },
    shop_rate = 0.0 -- rate in shop out of 100
}

-- Costumes

SMODS.ConsumableType {
    key = 'costumes', -- consumable type key
    collection_rows = {4, 4}, -- amount of cards in one page
    primary_colour = HEX(Kivolatro.colors.costume),
    secondary_colour = HEX(Kivolatro.colors.costume),
    shop_rate = 0.0, -- rate in shop out of 100
    loc_txt = {
        collection = 'Costumes', -- name displayed in collection
        name = 'Costumes', -- name displayed in badge
        undiscovered = {
            name = 'Unknown Costume', -- undiscovered name
            text = {'What type of clothe', 'it will be?'} -- undiscovered text
        }
    }
}

-- ghost consumables

SMODS.ConsumableType {
    key = 'waves', -- for greg
    no_collection = true,
    primary_colour = G.C.BLUE,
    secondary_colour = G.C.BLUE,
    shop_rate = 0.0,
    loc_txt = {
        name = "waves",
        text = {"descriptions of greg waves"}
    }
}

SMODS.ConsumableType {
    key = 'costumes_descs',
    no_collection = true,
    primary_colour = G.C.BLUE,
    secondary_colour = G.C.BLUE,
    shop_rate = 0.0,
    loc_txt = {
        name = "costumes_descs",
        text = {"descriptions of aplycable students"}
    }
}

SMODS.ConsumableType {
    key = 'boosters_descs',
    no_collection = true,
    primary_colour = G.C.BLUE,
    secondary_colour = G.C.BLUE,
    shop_rate = 0.0,
    loc_txt = {
        name = "boosters_extra_descs",
        text = {"boosters_extra_descs"}
    }
}
