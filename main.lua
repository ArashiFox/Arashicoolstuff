SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/wrath.lua"))()
    assert(SMODS.load_file("jokers/click.lua"))()
    assert(SMODS.load_file("jokers/bigjoker.lua"))()
    assert(SMODS.load_file("jokers/bossan.lua"))()
    assert(SMODS.load_file("jokers/chocolatemilk.lua"))()
    assert(SMODS.load_file("jokers/deer.lua"))()
    assert(SMODS.load_file("jokers/drivinginmycar.lua"))()
    assert(SMODS.load_file("jokers/emptybottle.lua"))()
    assert(SMODS.load_file("jokers/envy.lua"))()
    assert(SMODS.load_file("jokers/freddy.lua"))()
    assert(SMODS.load_file("jokers/gluttony.lua"))()
    assert(SMODS.load_file("jokers/gilbert.lua"))()
    assert(SMODS.load_file("jokers/grager.lua"))()
    assert(SMODS.load_file("jokers/grocerystore.lua"))()
    assert(SMODS.load_file("jokers/jussi.lua"))()
    assert(SMODS.load_file("jokers/kitler.lua"))()
    assert(SMODS.load_file("jokers/leo.lua"))()
    assert(SMODS.load_file("jokers/logo.lua"))()
    assert(SMODS.load_file("jokers/oopsall1s.lua"))()
    assert(SMODS.load_file("jokers/oopsall60s.lua"))()
    assert(SMODS.load_file("jokers/philosophicjoker.lua"))()
    assert(SMODS.load_file("jokers/sad.lua"))()
    assert(SMODS.load_file("jokers/sloth.lua"))()
    assert(SMODS.load_file("jokers/supergilb.lua"))()
    assert(SMODS.load_file("jokers/hennie.lua"))()
    assert(SMODS.load_file("jokers/triggerhappy.lua"))()
    assert(SMODS.load_file("jokers/trond.lua"))()
    assert(SMODS.load_file("jokers/warpedjoker.lua"))()
    assert(SMODS.load_file("jokers/waterbottle.lua"))()
    assert(SMODS.load_file("jokers/wellthisstinks.lua"))()
    assert(SMODS.load_file("jokers/jussegutten.lua"))()
    assert(SMODS.load_file("jokers/loyloy.lua"))()
    assert(SMODS.load_file("jokers/poppy.lua"))()
    assert(SMODS.load_file("jokers/brainrot.lua"))()
    assert(SMODS.load_file("jokers/greed.lua"))()
    assert(SMODS.load_file("jokers/yapchatfilter.lua"))()
    assert(SMODS.load_file("jokers/msskeleton.lua"))()
    assert(SMODS.load_file("jokers/tradeoffer.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/roffle.lua"))()
    assert(SMODS.load_file("consumables/dogement.lua"))()
    assert(SMODS.load_file("consumables/gilbert.lua"))()
    assert(SMODS.load_file("consumables/oracle.lua"))()
    assert(SMODS.load_file("consumables/catsoul.lua"))()
end
-- load the seals
if true then
    assert(SMODS.load_file("seals/orangeseal.lua"))()
    assert(SMODS.load_file("seals/gilbertseal.lua"))()
end

SMODS.ObjectType({
    key = "arashi_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_arashi_chocolatemilk"] = true,
        ["j_arashi_emptybottle"] = true,
        ["j_arashi_waterbottle"] = true
    },
})

SMODS.ObjectType({
    key = "arashi_leg_pets",
    cards = {
        ["j_arashi_bossan"] = true,
        ["j_arashi_jussegutten"] = true,
        ["j_arashi_loyloy"] = true
    },
})

SMODS.ObjectType({
    key = "arashi_pet",
    cards = {
        ["j_arashi_jussi"] = true,
        ["j_arashi_leo"] = true,
        ["j_arashi_poppy"] = true
    },
})

SMODS.ObjectType({
    key = "arashi_arashi_jokers",
    cards = {
        ["j_arashi_brainrot"] = true,
        ["j_arashi_greed"] = true,
        ["j_arashi_yapchatfilter"] = true,
        ["j_arashi_msskeleton"] = true,
        ["j_arashi_tradeoffer"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end