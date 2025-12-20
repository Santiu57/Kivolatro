-- Load mod config
Kivolatro.config = SMODS.current_mod.config

-- optional features
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    post_trigger = true,
    cardareas = {
        deck = true,
        discard = true
    }
}

-- Update values that get reset at the start of each round
SMODS.current_mod.reset_game_globals = function(run_start)

    if run_start then
        Kivolatro.miyu_max = 0
        Kivolatro.miyu_meme_max = 0
    end
end

Kivolatro.base_poker_hands = {"Straight Flush", "Four of a Kind", "Full House", "Flush", "Straight", "Three of a Kind",
                              "Two Pair", "Pair", "High Card"}

Kivolatro.base_ranks = {"Ace", "King", "Queen", "Jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"}

Kivolatro.base_rarities = {"Common", "Uncommon", "Rare", "Legendary"}

Kivolatro.base_suits = {"Spades", "Hearts", "Clubs", "Diamonds"}

Kivolatro.vanilla_food = {
    j_gros_michel = true,
    j_egg = true,
    j_ice_cream = true,
    j_cavendish = true,
    j_turtle_bean = true,
    j_diet_cola = true,
    j_popcorn = true,
    j_ramen = true,
    j_selzer = true
}

-- Define light and dark suits
Kivolatro.light_suits = {'Diamonds', 'Hearts'}
Kivolatro.dark_suits = {'Spades', 'Clubs'}

-- Disable specific items by commenting them out
Kivolatro.jokers = {
    spades_jokers = {
        miyu = {"chocolate_bark", "im_coming", "miyu_pat", "miyu", "sad_bunny_thermos"},
        kasumi = {"red_rector", "ugh", "kasumi", "chocolate_slipper"},
        mari = {"mari", "mari_track", "mari_idol", "mariuoh", "mari_holy_water", "chocolate_sister_figure", "piety",
                "neat_white_corsage"},
        karin = {"big_eye", "chocolate_omurice", "karin", "karin_stare"},
        kanna = {"valkyrie_service_pistol_no17", "an_everyday_coffee", "kanna", "its_fine"},
        haruna = {"ideal", "gourmet_matcha_chocolate", "haruna", "eat_or_die"},
        haruka = {"blow_away", "haruka", "haruka_cacao_99", "haruka_kaboom"},
        toki = {"time_of_secrecy", "toki", "choco_cake", "toki_bunny", "toki_school", "stray_toki",
                "high_performance_headset"},
        seia = {"seia", "sharp_Illumination", "seia_chocolate", "seia_muted", "seia_drift"},
        saori = {"saori", "decadent_chocolate", "arius_assault_rifle", "saori_mask"},
        kisaki = {"kisaki", "cacao_nibs_tea", "know_thyself_know_thy_enemy"},
        shiroko = {"shiroko", "rider_snack", "white_fang_465", "shiroko_drone"},
        hina = {"hina", "hina_homemade_chocolate", "hina_prefect_team_armband", "destroyer_of_denouement"}
    },
    diamond_jokers = {
        mika = {"quis_ut_deus", "rollcake", "mika"}
    },
    hearts_jokers = {},
    clubs_jokers = {},
    fumos = {
    "mari_fumo", "sakurako_fumo", "hinata_fumo", 
    "hina_fumo", "iori_fumo", "chinatsu_fumo","ako_fumo", 
    "arona_fumo", "plana_fumo",
    "karin_fumo", "toki_fumo", "akane_fumo", "asuna_fumo", "neru_fumo",
    "noa_fumo", "yuuka_fumo", "koyuki_fumo","rio_fumo",
    "haruka_fumo", "aru_fumo", "kayoko_fumo","mutsuki_fumo",
    "shiroko_fumo", "ayane_fumo", "serika_fumo", "hoshino_fumo", "nonomi_fumo",
    "kanna_fumo", "fubuki_fumo", "kirino_fumo",
    "saori_fumo", "atsuko_fumo", "misaki_fumo", "hiyori_fumo",
    "haruna_fumo", "junko_fumo", "izumi_fumo","akari_fumo",
    "koharu_fumo","hanako_fumo","hifumi_fumo","azusa_fumo",
    "tsubaki_fumo","kaede_fumo","mimori_fumo",
             },
    blind_jokers = {"greg_organ"}
}

Kivolatro.consumables = {
    resources = {
        activity_report = {"novice_activity_report", "normal_activity_report", "advanced_activity_report",
                           "superior_activity_report"},
        artifact_box = {"novice_artifact_box", "normal_artifact_box", "advanced_artifact_box", "superior_artifact_box"},
        tech_notes = {"beginner_tech_notes", "normal_tech_notes", "advanced_tech_notes", "superior_tech_notes"},
        tactical_training_bluray = {"beginner_tactical_training_blu-ray", "normal_tactical_training_blu-ray",
                                    "advanced_tactical_training_blu-ray", "superior_tactical_training_blu-ray"},
        fusion_keystone = {"lesser_fusion_keystone", "normal_fusion_keystone", "advanced_fusion_keystone",
                           "superior_fusion_keystone"},
        misc = {"arona_stamp", "chise_doll", "credit_card_shards", "cuffs", "perfect_exam_paper",
                "phrenapates_credit_card", "video_game_magazine"}
    },
    costumes = {"idol_costume"},
    ghost_consumables = {
        greg_waves = {"yellow", "blue", "green", "red"},
        costumes_descs = {"students_idols"},
        booster_packs = {"desc_school_packs"}
    }
}

Kivolatro.boosters = {
    student_boosters = {"student_booster_normal", "student_booster_jumbo", "student_booster_mega"},
    fumo_boosters = {"fumo_booster_normal", "fumo_booster_jumbo", "fumo_booster_mega"},
    resources_boosters = {"resource_booster_normal", "resource_booster_jumbo", "resource_booster_mega"},
    school_boosters = {"trinity_booster", "gehenna_booster", "millennium_booster", "china_booster", "misc_booster"},
    arm_boosters = {"arm_booster_normal", "arm_booster_jumbo", "arm_booster_mega"},
    meme_boosters = {"meme_booster_normal", "meme_booster_jumbo", "meme_booster_mega"},
    item_boosters = {"item_booster_normal", "item_booster_jumbo", "item_booster_mega"},
    choco_boosters = {"choco_booster_normal", "choco_booster_jumbo", "choco_booster_mega"},
    "q_booster"
}

Kivolatro.spectrals = {}

Kivolatro.blinds = {"gregorius"}

Kivolatro.vouchers = {}

Kivolatro.tags = {"blue_tag"}

Kivolatro.enhancements = {
    fan = {"mari", "sakurako", "mine"},
    "choco",
    "bless",
    "secret"
}

Kivolatro.editions = {"blue"}

Kivolatro.decks = {}

Kivolatro.stickers = {}

Kivolatro.music_list = {"track_1", "track_2", "track_3", "track_4", "track_5"}

-- Costumes students

Kivolatro.idol_costume_students = {
    [1] = "mari",
    [2] = "sakurako",
    [3] = "mine"
}

-- pools
SMODS.ObjectType({
    key = "trinity_students",
    default = "j_mari",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

SMODS.ObjectType({
    key = "gehenna_students",
    default = "j_hina",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

SMODS.ObjectType({
    key = "millennium_students",
    default = "j_toki",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

SMODS.ObjectType({
    key = "china_students",
    default = "j_yukari",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

SMODS.ObjectType({
    key = "misc_students",
    default = "j_shiroko",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

SMODS.ObjectType({
    key = "school_packs",
    default = "p_trinity_booster",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})
