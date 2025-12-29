Kivolatro.miyu_max = 0
Kivolatro.miyu_meme_max = 0

-- for enhancements

Kivolatro.can_melt = true
Kivolatro.extra_secret_draws = 0

-- for greg

Kivolatro.wave_color = "FFFF00"
Kivolatro.waves_colors = {
    [1] = "Yellow",
    [2] = "Blue",
    [3] = "Red",
    [4] = "Green",
    [5] = "FFFF00",
    [6] = "0000FF",
    [7] = "FF0000",
    [8] = "00FF00"
}

-- jokers costs by rarity, maybe some are change individualy

Kivolatro.choco_cost = 4
Kivolatro.student_cost = 5
Kivolatro.fumo_cost = 5
Kivolatro.meme_cost = 6
Kivolatro.arm_cost = 4
Kivolatro.item_cost = 5
Kivolatro.q_cost = 7

-- fumo positions
Kivolatro.back_fumos = {
    x = 8,
    y = 6
}

-- colors
Kivolatro.colors = {
    resource = "8b87c9", -- boosters ready
    choco = "8a401e", -- boosters ready
    student = "493dfb", -- boosters ready
    q = "008B8B", -- ??????? color ??? jokers left, to complete all the animation
    fumo = "fff717", -- boosters ready
    meme = "ff3d3d", -- boosters ready
    arm = "fb3d6c", -- boosters ready
    item = "66fb3d", -- boosters ready
    school = "9f3dfb",
    kivo = "B2FFFF",
    blue = "004DC8",
    blessed = "FFD877",
    costume = "898B98",
    trinity = "F4BB51", -- boosters ready
    gehena = "AE3232", -- boosters ready
    millennium = "8AB6F2", -- boosters ready
    shanhaijing = "7EBF91", -- boosters ready
    hyakkiyako = "E46498", -- boosters ready
    valk = "B0B3E3",
    arius = "C4C4C4",
    srt = "EAEAE9",
    red_winter = "BA3556",
    abydos = "61C8D9",
    agent = "D8D8D8"
}

Kivolatro.student_Colors = {
    mari = "FABC81", sakurako = "ECE8E5", hinata = "FFFA8F",
    hina = "97668D", iori = "D3D9DC", chinatsu = "E79F5F", ako = "9BB3D8",
    arona = "AECADA", plana = "D7C9D2",
    karin = "7E6287", toki = "5BD1E4", akane = "EBDEC3", asuna = "457FA2", neru = "F39E97",
    noa = "A0CFEA", yuuka = "615C97", koyuki = "FDC8DA", rio = "C0474A",
    haruka = "564C89", aru = "E7999D", kayoko = "C0C0C0", mutsuki = "A25765",
    shiroko = "82FCFD", ayane = "E2524C", serika = "FF70B6", hoshino = "FDDFE5", nonomi = "D1FC01",
    kanna = "DBFFFF", fubuki = "FFB4E4", kirino = "A5CAFE",
    saori = "B9D6FF", atsuko = "DDC8E6", misaki = "F7679E", hiyori = "C5FDFE",
    haruna = "CF5B46", junko = "EF386F", izumi = "FFFFC7", akari = "FEF2CB",
    koharu = "F6C2CB", hanako = "FAD0D5", hifumi = "FFFFC8", azusa = "EDD9F1",
    michiru = "FF3186", tsukuyo = "9F76BD", izuna = "F52683",
    airi = "A1EADD", yoshimi = "F5DFB4", natsu = "FDDCD5", kazusa = "F99DBF",
    hare = "DDDE0B", chihiro = "7BDFFA", kotama = "B4B0F3", maki = "D86369",
    tsubaki = "C73636", kaede = "FF84A8", mimori = "F7E0DC",
    kasumi = "C56360", megu = "DC5970",
    fuuka = "EB7E95", juri = "FEB7C4"
}

-- boss blinds colors

Kivolatro.blinds_colors = {
    greg = "8A82F1"
}

-- Gradients

Kivolatro.schools_gradient = SMODS.Gradient {
    key = "schools_gradient",
    colours = {HEX(Kivolatro.colors.trinity), HEX(Kivolatro.colors.gehena), HEX(Kivolatro.colors.millennium),
               HEX(Kivolatro.colors.shanhaijing), HEX(Kivolatro.colors.hyakkiyako)},
    cycle = 8,
    interpolation = "trig"
}

Kivolatro.misc_gradient = SMODS.Gradient {
    key = "misc_gradient",
    colours = {HEX(Kivolatro.colors.valk), HEX(Kivolatro.colors.arius), HEX(Kivolatro.colors.srt),
               HEX(Kivolatro.colors.red_winter), HEX(Kivolatro.colors.abydos)},
    cycle = 8,
    interpolation = "trig"
}

Kivolatro.china_gradient = SMODS.Gradient {
    key = "china_gradient",
    colours = {HEX(Kivolatro.colors.shanhaijing), HEX(Kivolatro.colors.hyakkiyako)},
    cycle = 5,
    interpolation = "trig"
}

-- for haruka 

Kivolatro.haruka_noises = 8
Kivolatro.haruka_voicelines = {
    [1] = "Sorry, Sorry, Sorry!",
    [2] = "Don't run, don't run, don't run, don't run!",
    [3] = "Wh-Whoaaah!",
    [4] = "Whoaaa!",
    [5] = "Please Die, Please Die, Please Die!",
    [6] = "Unforgivable, unforgivable, unforgivable!",
    [7] = "Heeheehee... Hueh?!",
    [8] = "Eh.. Hiaah!"
}

-- for music manager

Kivolatro.current_track = Kivolatro.next_music()
Kivolatro.music = {
    sound = nil,
    duration = nil
}

-- for animations 

MIYU_PAT = 1
MARIUOH = 1
SEIA_DRIFT = 1
Q_BOOSTER = 1
