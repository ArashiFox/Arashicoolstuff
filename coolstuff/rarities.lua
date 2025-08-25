SMODS.Rarity {
    key = "fucking_insane",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ff0055'),
    loc_txt = {
        name = "fucking insane"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}