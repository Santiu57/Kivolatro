Kivolatro = {}
local kivolatro = SMODS.current_mod
local filesystem = NFS or love.filesystem

local loc = filesystem.load(kivolatro.path .. 'localization.lua')()
Kivolatro.loc = loc

-- loads utilities
SMODS.load_file("utilities/definitions.lua")()
SMODS.load_file("utilities/misc_functions.lua")()
SMODS.load_file("utilities/global_values.lua")()
SMODS.load_file("utilities/overrides.lua")()
SMODS.load_file("utilities/config_tabs.lua")()

-- loads content
SMODS.load_file("content/atlas.lua")()
SMODS.load_file("content/music.lua")()
SMODS.load_file("content/sounds.lua")()
SMODS.load_file("content/raritys.lua")()

-- loads jokers
Kivolatro.register(Kivolatro.jokers, "content/jokers")

-- loads consumables
SMODS.load_file("content/consumables/consumables_types.lua")()
Kivolatro.register(Kivolatro.consumables, "content/consumables")

-- loads boosters
Kivolatro.register(Kivolatro.boosters, "content/boosters")

-- loads enhancements
Kivolatro.register(Kivolatro.enhancements, "content/enhancements")

-- loads editions
Kivolatro.register(Kivolatro.editions, "content/editions")

-- loads tags
Kivolatro.register(Kivolatro.tags, "content/tags")

-- loads blinds
Kivolatro.register(Kivolatro.blinds, "content/blinds")
