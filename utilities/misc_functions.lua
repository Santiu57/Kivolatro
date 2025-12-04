function Kivolatro.register(tbl, base_path, current_path)
    current_path = current_path or ""

    for key, value in pairs(tbl) do
        if type(value) == "table" then
            Kivolatro.register(value, base_path, current_path .. "/" .. key)
        elseif type(value) == "string" then
            local full_path = base_path .. current_path .. "/" .. value .. ".lua"
            SMODS.load_file(full_path)()
        end
    end
end

function Kivolatro.add_tag(tag, event, silent)
    local func = function()
        add_tag(type(tag) == 'string' and Tag(tag) or tag)
        if not silent then
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
        end
        return true
    end

    if event then
        G.E_MANAGER:add_event(Event {
            func = func
        })
    else
        func()
    end
end

function Kivolatro.poll_tag(seed, options)
    -- This part is basically a copy of how the base game does it
    -- Look at get_next_tag_key in common_events.lua
    local pool = options or get_current_pool('Tag')
    local tag_key = pseudorandom_element(pool, pseudoseed(seed))

    while tag_key == 'UNAVAILABLE' do
        tag_key = pseudorandom_element(pool, pseudoseed(seed))
    end

    local tag = Tag(tag_key)

    -- The way the hand for an orbital tag in the base game is selected could cause issues
    -- with mods that modify blinds, so we randomly pick one from all visible hands
    if tag_key == "tag_orbital" then
        local available_hands = {}

        for _, k in ipairs(G.handlist) do
            local hand = G.GAME.hands[k]
            if hand.visible then
                available_hands[#available_hands + 1] = k
            end
        end

        tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(seed .. '_orbital'))
    end

    return tag
end

-- functions or things from Cryptid

local mod_path = "" .. SMODS.current_mod.path -- this path changes when each mod is loaded, but the local variable will retain Kivolatro's path
Kivolatro.path = mod_path
Kivolatro_config = SMODS.current_mod.config

function Kivolatro.advanced_find_joker(name, rarity, edition, ability, non_debuff, area)
    local jokers = {}
    if not G.jokers or not G.jokers.cards then
        return {}
    end
    local filter = 0
    if name then
        filter = filter + 1
    end
    if edition then
        filter = filter + 1
    end
    if type(rarity) ~= "table" then
        if type(rarity) == "string" then
            rarity = {rarity}
        else
            rarity = nil
        end
    end
    if rarity then
        filter = filter + 1
    end
    if type(ability) ~= "table" then
        if type(ability) == "string" then
            ability = {ability}
        else
            ability = nil
        end
    end
    if ability then
        filter = filter + 1
    end
    -- return nothing if function is called with no useful arguments
    if filter == 0 then
        return {}
    end
    if not area or area == "j" then
        for k, v in pairs(G.jokers.cards) do
            if v and type(v) == "table" and (non_debuff or not v.debuff) then
                local check = 0
                if name and v.ability.name == name then
                    check = check + 1
                end
                if edition and (v.edition and v.edition.key == edition) --[[ make this use Kivolatro.safe_get later? if it's possible anyways]] then
                    check = check + 1
                end
                if rarity then
                    -- Passes as valid if rarity matches ANY of the values in the rarity table
                    for _, a in ipairs(rarity) do
                        if v.config.center.rarity == a then
                            check = check + 1
                            break
                        end
                    end
                end
                if ability then
                    -- Only passes if the joker has everything in the ability table
                    local abilitycheck = true
                    for _, b in ipairs(ability) do
                        if not v.ability[b] then
                            abilitycheck = false
                            break
                        end
                    end
                    if abilitycheck then
                        check = check + 1
                    end
                end
                if check == filter then
                    table.insert(jokers, v)
                end
            end
        end
    end
    if not area or area == "c" then
        for k, v in pairs(G.consumeables.cards) do
            if v and type(v) == "table" and (non_debuff or not v.debuff) then
                local check = 0
                if name and v.ability.name == name then
                    check = check + 1
                end
                if edition and (v.edition and v.edition.key == edition) --[[ make this use Kivolatro.safe_get later? if it's possible anyways]] then
                    check = check + 1
                end
                if ability then
                    -- Only passes if the joker has everything in the ability table
                    local abilitycheck = true
                    for _, b in ipairs(ability) do
                        if not v.ability[b] then
                            abilitycheck = false
                            break
                        end
                    end
                    if abilitycheck then
                        check = check + 1
                    end
                end
                -- Consumables don't have a rarity, so this should ignore it in that case (untested lmfao)
                if check == filter then
                    table.insert(jokers, v)
                end
            end
        end
    end
    return jokers
end

function Kivolatro.safe_get(t, ...)
    local current = t
    for _, k in ipairs({...}) do
        if not current or current[k] == nil then
            return false
        end
        current = current[k]
    end
    return current
end

function Kivolatro.get_most_played_hand() -- From Maximus mod
    local _handname, _played, _order = 'High Card', -1, 100
    for k, v in pairs(G.GAME.hands) do
        if v.played > _played or (v.played == _played and _order > v.order) then
            _played = v.played
            _handname = k
        end
    end

    return _handname
end

function Kivolatro.get_least_played_hand()
    local _handname, _played, _order = 'High Card', 9999999, 100
    for k, v in pairs(G.GAME.hands) do
        if v.played < _played or (v.played == _played and _order > v.order) then
            _played = v.played
            _handname = k
        end
    end

    return _handname
end

-- From jen lib

function Kivolatro.planethand(hand) -- find the planet card of an specified hand
    local key
    for k, v in pairs(G.P_CENTER_POOLS.Planet) do
        if v.config.hand_type == hand then
            key = v.key
            break
        end
    end
    return key
end

-- Functions made by myself, with some inspirations from other mods

function Kivolatro.fumo_count()
    local fumocount = 0
    if Kivolatro.safe_get(G, "jokers") then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i]:is_rarity("kivo_fumo") then
                fumocount = fumocount + 1
            end
        end
    end
    return fumocount
end

function Kivolatro.random_joker()
    local random_number = pseudorandom(pseudoseed('kivo'))
    local random_index = math.floor(random_number * #G.jokers.cards) + 1
    if random_index < 0.5 then
        random_index = 1
    else
        if random_index > #G.jokers.cards then
            random_index = #G.jokers.cards
        end
    end
    local random_joker = G.jokers.cards[random_index]
    return random_joker
end

function Kivolatro.undebuff_all_jokers()
    for i = 1, #G.jokers.cards do
        G.jokers.cards[i]:set_debuff(false)
    end
end

function Kivolatro.undebuff_specific_joker(key)
    SMODS.find_card(key, true):set_debuff(false)
end

function Kivolatro.right_wave_color(wave)
    for i = 1, 4 do
        if wave == Kivolatro.waves_colors[i] then
            Kivolatro.wave_color = Kivolatro.waves_colors[i + 4]
        end
    end
end

function Kivolatro.most_played_hand() -- returns the key of the most played hand planet card
    local handname = Kivolatro.get_most_played_hand()
    local planet = Kivolatro.planethand(handname)
    return planet
end

function Kivolatro.random_consumable()
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        local card = create_card("Consumeables", G.consumeables, nil, nil, nil, nil, nil, "kivolatro")
        card:add_to_deck()
        G.consumeables:emplace(card)
    end
end

function Kivolatro.all_jokers_edition(joker) -- if all jokers have edition, return true, else return false, joker is if want to ignore a joker
    local edition_jokers = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].edition or G.jokers.cards[i] == joker then
            edition_jokers = edition_jokers + 1
        end
    end
    if edition_jokers == #G.jokers.cards then
        return true
    else
        return false
    end
end

Kivolatro.banned_keys = {"hand_size", "joker_slots", "hands", "discards", "extra_draws", "ante", "odds", "retriggers",
                         "value", "needed", "scored", "destroyed", "rerolls", "fumos", "blinds"} -- keys that won't be multiplied

function Kivolatro.is_banned(key)
    for i = 1, #Kivolatro.banned_keys do
        if key == Kivolatro.banned_keys[i] then
            return true
        end
    end
    return false
end

function Kivolatro.multiply_extras(joker, value)
    for k, v in pairs(joker.ability.extra) do
        if not Kivolatro.is_banned(k) and type(v) == "number" then
            joker.ability.extra[k] = v * value
        end
    end
end

function Kivolatro.random_hand(seed)
    local _poker_hands = {}
    local hand = "High Card"
    for k, v in pairs(G.GAME.hands) do
        if v.visible then
            _poker_hands[#_poker_hands + 1] = k
        end
    end
    hand = pseudorandom_element(_poker_hands, pseudoseed(seed))
    return hand
end

-- function that returns respective haruka key sound (a = math.random(Kivolatro.haruka_noises))
function Kivolatro.haruka_sound(a)
    local sound = "tarot1"
    if a == 1 then
        sound = "kivo_haruka_gomen"
    end
    if a == 2 then
        sound = "kivo_haruka_dont_run"
    end
    if a == 3 then
        sound = "kivo_haruka_whoa_1"
    end
    if a == 4 then
        sound = "kivo_haruka_whoa_2"
    end
    if a == 5 then
        sound = "kivo_haruka_die"
    end
    if a == 6 then
        sound = "kivo_haruka_Unforgivable"
    end
    if a == 7 then
        sound = "kivo_haruka_whoa_3"
    end
    if a == 8 then
        sound = "kivo_haruka_whoa_4"
    end
    return sound
end

function Kivolatro.random_reload_sound(fixed) -- function that returns a random reload sound, or fixed
    if not fixed then
        fixed = math.random(4)
    end
    local sound = "kivo_r1"
    if fixed == 1 then
        sound = "kivo_r1"
    elseif fixed == 2 then
        sound = "kivo_r2"
    elseif fixed == 3 then
        sound = "kivo_r3"
    elseif fixed == 4 then
        sound = "kivo_r4"
    end
    return sound
end

function Kivolatro.random_shot_sound(fixed) -- function that returns a random shoot sound, or fixed
    if not fixed then
        fixed = math.random(4)
    end
    local sound = "kivo_s1"
    if fixed == 1 then
        sound = "kivo_s1"
    elseif fixed == 2 then
        sound = "kivo_s2"
    elseif fixed == 3 then
        sound = "kivo_s3"
    elseif fixed == 4 then
        sound = "kivo_s4"
    end
    return sound
end

function Kivolatro.random_shotgun_shot_sound(fixed) -- random between 1 and 2, else fixed
    if not fixed then
        fixed = math.random(2)
    end
    local sound = "tarot1"
    if fixed == 1 then
        sound = "kivo_ss1"
    else
        if fixed == 2 then
            sound = "kivo_ss2"
        end
    end
    return sound
end

function Kivolatro.china_random_color(fixed) -- function that returns a random china color
    if not fixed then
        fixed = math.random(2)
    end
    local color = G.C.BLUE
    if fixed == 1 then
        color = HEX(Kivolatro.colors.shanhaijing)
    end
    if fixed == 2 then
        color = HEX(Kivolatro.colors.hyakkiyako)
    end
    return color
end

function Kivolatro.misc_random_color(fixed) -- function that returns a random misc color
    if not fixed then
        fixed = math.random(5)
    end
    local color = G.C.BLUE
    if fixed == 1 then
        color = HEX(Kivolatro.colors.valk)
    end
    if fixed == 2 then
        color = HEX(Kivolatro.colors.arius)
    end
    if fixed == 3 then
        color = HEX(Kivolatro.colors.srt)
    end
    if fixed == 4 then
        color = HEX(Kivolatro.colors.red_winter)
    end
    if fixed == 5 then
        color = HEX(Kivolatro.colors.abydos)
    end
    return color
end

function Kivolatro.add_playing_card(suit, rank) -- suit = H, D, C, S; rank = 14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
    local card = create_playing_card({
        front = G.P_CARDS[suit .. "_" .. rank],
        center = G.P_CENTERS.c_base
    }, G.hand)
    G.GAME.blind:debuff_card(card)
    G.hand:sort()
    card:juice_up()
    return card
end

function Kivolatro.add_random_modifier(card, key, en, se, ed) -- adds a random modifier to a card, key is the seed, (en =  enhancements, se =  seals, ed =  editions) base prob = 1
    local enhancement = SMODS.poll_enhancement {
        key = key,
        mod = en
    }
    local seal = SMODS.poll_seal {
        key = key,
        mod = se
    }
    local edition = poll_edition(key, ed, false, false)

    if not SMODS.has_enhancement(card) and enhancement then
        card:set_ability(enhancement)
        card:juice_up()
    end
    if not card.seal and seal then
        card:set_seal(seal)
        card:juice_up()
    end
    if not card.edition and edition then
        card:set_edition(edition, true)
        card:juice_up()
    end
end

function Kivolatro.add_booster(key, cost)
    G.E_MANAGER:add_event(Event {
        func = function()
            local booster = SMODS.add_booster_to_shop(key)
            booster.cost = cost
            return true
        end
    })
end

function Kivolatro.isPs68(key)
    local ps68_keys = {"j_kivo_haruka", "j_kivo_aru", "j_kivo_mutsuki", "j_kivo_kayoko"}
    for i = 1, #ps68_keys do
        if key == ps68_keys[i] then
            return true
        end
    end
    return false
end

function Kivolatro.isStudent(key)
    if key == "kivo_student" then
        return true
    end
    if key == "kivo_student_costumes" then
        return true
    end
    return false
end

-- for consumables

function Kivolatro.apply_bonus_to_highlighted(params) -- thanks chatgpt
    -- params: {sound_main, sound_cards, message_key, color, bonus_key, bonus_value, extra_juice}
    local sound_main = params.sound_main or 'tarot1'
    local sound_cards = params.sound_cards or 'card1'
    local message_key = params.message_key or 'a_chips'
    local color = params.color or G.C.CHIPS
    local bonus_key = params.bonus_key or 'perma_bonus'
    local bonus_value = params.bonus_value or 0
    local extra_juice = params.extra_juice or {0.3, 0.3}
    local dollar = false

    for i = 1, #G.hand.highlighted do
        local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                play_sound(sound_cards, percent)
                G.hand.highlighted[i]:juice_up(extra_juice[1], extra_juice[2])
                return true
            end
        }))
    end

    delay(0.05)

    for i = 1, #G.hand.highlighted do
        local card = G.hand.highlighted[i]

        if dollar == false then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize {
                    type = 'variable',
                    key = message_key,
                    vars = {bonus_value}
                },
                colour = color
            })
        else
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('$') .. bonus_value,
                colour = color
            })
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                card.ability[bonus_key] = card.ability[bonus_key] or 0
                card.ability[bonus_key] = card.ability[bonus_key] + bonus_value
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                card:juice_up(extra_juice[1], extra_juice[2])
                return true
            end
        }))
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            G.hand:unhighlight_all()
            return true
        end
    }))

    delay(0.5)
end

-- kivolatro music manager

function Kivolatro.random_list(music_list)
    local copy = {}
    for i, v in ipairs(music_list) do
        copy[i] = v
    end
    for i = #copy, 2, -1 do
        local j = math.random(1, i)
        copy[i], copy[j] = copy[j], copy[i]
    end
    return copy
end

Kivolatro.song_list = Kivolatro.random_list(Kivolatro.music_list)

function Kivolatro.next_music()
    if #Kivolatro.song_list == 0 then
        Kivolatro.song_list = Kivolatro.random_list(Kivolatro.music_list)
    end
    return table.remove(Kivolatro.song_list, 1)
end

function Kivolatro.isTrackPlaying(track)
    local sources = SMODS.Sounds[track]
    if sources then
        for _, s in ipairs(sources) do
            if s.sound and s.sound:isPlaying() then
                return true
            end
        end
    end
    return false
end

function Kivolatro.find_music(key)
    for k, v in pairs(SOURCES) do
        if string.find(k, string.sub(key, 1)) then
            for i, s in ipairs(v) do
                return s.sound
            end
        end
    end
end

local contador = 0
-- Game:update functions
local upd = Game.update
function Game:update(dt)
    upd(self, dt)
    if miyu_pat then
        miyu_pat = miyu_pat + (dt * 3)
    end
    if mariuoh then
        mariuoh = mariuoh + (dt * 3)
    end
    if seia_drift then
        seia_drift = seia_drift + (dt * 3)
    end
    if q_booster_dt then
        q_booster_dt = q_booster_dt + (dt)
    end

    -- miyu pat animation
    if G.P_CENTERS and G.P_CENTERS.j_kivo_miyu_pat and miyu_pat > 0.1 then
        miyu_pat = 0
        local miyupatbj = G.P_CENTERS.j_kivo_miyu_pat
        if miyupatbj.pos.x == 2 and miyupatbj.pos.y == 1 then
            miyupatbj.pos.x = 0
            miyupatbj.pos.y = 0
        elseif miyupatbj.pos.x < 2 then
            miyupatbj.pos.x = miyupatbj.pos.x + 1
        elseif miyupatbj.pos.y < 1 then
            miyupatbj.pos.x = 0
            miyupatbj.pos.y = miyupatbj.pos.y + 1
        end
    end

    -- mariuoh animation
    if G.P_CENTERS and G.P_CENTERS.j_kivo_mariuoh and mariuoh > 0.1 then
        mariuoh = 0
        local mariuohbj = G.P_CENTERS.j_kivo_mariuoh
        if mariuohbj.pos.x == 22 and mariuohbj.pos.y == 7 then
            mariuohbj.pos.x = 0
            mariuohbj.pos.y = 0
        elseif mariuohbj.pos.x < 22 then
            mariuohbj.pos.x = mariuohbj.pos.x + 1
        elseif mariuohbj.pos.y < 7 then
            mariuohbj.pos.x = 0
            mariuohbj.pos.y = mariuohbj.pos.y + 1
        end
    end

    -- seia drift animation
    if G.P_CENTERS and G.P_CENTERS.j_kivo_seia_drift and seia_drift > 0.1 then
        seia_drift = 0
        local seia_drift = G.P_CENTERS.j_kivo_seia_drift
        if seia_drift.pos.x == 52 and seia_drift.pos.y == 0 then
            seia_drift.pos.x = 0
            seia_drift.pos.y = 0
        elseif seia_drift.pos.x < 52 then
            seia_drift.pos.x = seia_drift.pos.x + 1
        elseif seia_drift.pos.y < 0 then
            seia_drift.pos.x = 0
            seia_drift.pos.y = seia_drift.pos.y + 1
        end
    end

    -- ??? booster animation
    if G.P_CENTERS and G.P_CENTERS.p_kivo_q_booster and q_booster_dt > 0.1 then
        q_booster_dt = 0
        local p_kivo_q_booster = G.P_CENTERS.p_kivo_q_booster
        if p_kivo_q_booster.pos.x == 9 and p_kivo_q_booster.pos.y == 5 then
            p_kivo_q_booster.pos.x = 0
            p_kivo_q_booster.pos.y = 0
        elseif p_kivo_q_booster.pos.x < 9 then
            p_kivo_q_booster.pos.x = p_kivo_q_booster.pos.x + 1
        elseif p_kivo_q_booster.pos.y < 5 then
            p_kivo_q_booster.pos.x = 0
            p_kivo_q_booster.pos.y = p_kivo_q_booster.pos.y + 1
        end
    end

    -- music manager
    local current = SMODS.Sound:get_current_music()
    if SMODS.Sound:get_current_music() then
        Kivolatro.music.sound = Kivolatro.find_music(SMODS.Sound:get_current_music())
        for k, v in pairs(SOURCES) do
            if string.find(k, 'music') or 1 == 1 then
                if v[1] and v[1].sound and v[1].sound:isPlaying() then
                    Kivolatro.music.duration = v[1].sound:getDuration()
                    Kivolatro.music.music = k
                    Kivolatro.k = v[1]
                end
            end
        end
        contador = contador + dt
        if Kivolatro.music.duration == nil then
            Kivolatro.music.duration = 10
        else
            if contador >= Kivolatro.music.duration - 1.5 then
                contador = 0
                Kivolatro.current_track = Kivolatro.next_music()
            end
        end
    end
end
