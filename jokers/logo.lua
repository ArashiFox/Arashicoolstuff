
SMODS.Joker{ --Logo
    key = "logo",
    config = {
        extra = {
            echips0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Logo',
        ['text'] = {
            [1] = '{C:red}^6 Mult {} If played card is an',
            [2] = '{C:attention}Ace{} of {C:hearts}Hearts{} and {C:attention}Joker{} is owned'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and context.other_card:is_suit("Hearts") and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_joker" then 
                        return true
                    end
                end
            end)()) then
                return {
                    e_chips = 7
                }
            end
        end
    end
}