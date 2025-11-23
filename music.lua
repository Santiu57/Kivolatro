SMODS.Sound({
    key = "Seia_sw_music",
    path = "Seia_sw_music.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return Kivolatro_config.Kivolatro.Always_Drifting or next(find_joker("seia_drift")) or
                   next(find_joker("j_kivo_seia_drift"))
    end
})

SMODS.Sound({
    key = "track_292_music",
    path = "track_292.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return not Kivolatro_config.Kivolatro.Always_Drifting and Kivolatro_config.Kivolatro.track_292
    end
})

SMODS.Sound({
    key = "Gregorius_Symphony_music",
    path = "Gregorius_Symphony.ogg",
    sync = true,
    pitch = 1,
    vol = 0.5,
    select_music_track = function()
        return Kivolatro_config.boss_music and next(find_joker("j_kivo_organ")) or next(find_joker("organ"))
    end
})

SMODS.Sound({
    key = "track_1_music",
    path = "Track_1.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return Kivolatro_config.blue_music and not Kivolatro_config.Kivolatro.Always_Drifting and
                   Kivolatro.current_track == "track_1"
    end
})

SMODS.Sound({
    key = "track_2_music",
    path = "Track_2.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return Kivolatro_config.blue_music and not Kivolatro_config.Kivolatro.Always_Drifting and
                   Kivolatro.current_track == "track_2"
    end
})

SMODS.Sound({
    key = "track_3_music",
    path = "Track_3.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return Kivolatro_config.blue_music and not Kivolatro_config.Kivolatro.Always_Drifting and
                   Kivolatro.current_track == "track_3"
    end
})

SMODS.Sound({
    key = "track_4_music",
    path = "Track_4.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return Kivolatro_config.blue_music and not Kivolatro_config.Kivolatro.Always_Drifting and
                   Kivolatro.current_track == "track_4"
    end
})

SMODS.Sound({
    key = "track_5_music",
    path = "Track_5.ogg",
    sync = true,
    pitch = 1,
    select_music_track = function()
        return Kivolatro_config.blue_music and not Kivolatro_config.Kivolatro.Always_Drifting and
                   Kivolatro.current_track == "track_5"
    end
})
