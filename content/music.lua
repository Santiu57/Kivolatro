SMODS.Sound({
    key = "Seia_sw_music",
    path = "city_seia.ogg",
    pitch = 1,
    select_music_track = function()
        if Kivolatro_config.Kivolatro.Always_Drifting then
            return 99
            else if next(find_joker("seia_drift")) or next(find_joker("j_kivo_seia_drift")) then
                return 6
            end
        end
    end
})

SMODS.Sound({
    key = "kikyou_music",
    path = "kikyou_music.ogg",
    pitch = 1,
    select_music_track = function()
        return not Kivolatro_config.Kivolatro.Always_Drifting and next(find_joker("mari_fumo")) or
        next(find_joker("j_kivo_mari_fumo"))
    end
})

SMODS.Sound({
    key = "track_292_music",
    path = "track_292.ogg",
    pitch = 1,
    select_music_track = function()
        if Kivolatro_config.Kivolatro.track_292 then
            return 4
        end
    end
})

SMODS.Sound({
    key = "Gregorius_Symphony_music",
    path = "Gregorius_Symphony.ogg",
    pitch = 1,
    vol = 0.5,
    select_music_track = function()
        if Kivolatro_config.boss_music and next(find_joker("j_kivo_organ")) or next(find_joker("organ")) then
            return 7
        end
    end
})

SMODS.Sound({
    key = "KARAKURhythm_music",
    path = "KARAKURhythm - quilt heron.mp3",
    pitch = 1,
    select_music_track = function()
        if next(find_joker("j_kivo_mariuoh")) or next(find_joker("j_kivo_mariuoh")) then
            return 6
        end
    end
})
