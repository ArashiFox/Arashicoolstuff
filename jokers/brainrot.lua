
SMODS.Joker{ --Brainrotted joker
    key = "brainrot",
    config = {
        extra = {
            scale0 = 10,
            rotation0 = 20,
            xmult0 = 6.7
        }
    },
    loc_txt = {
        ['name'] = 'Brainrotted joker',
        ['text'] = {
            [1] = '{X:mult,C:white}X6.7{} Mult,',
            [2] = 'Might annoy you a',
            [3] = 'little bit.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 0.9, 
        h = 95 * 0.9
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["arashi_arashi_jokers"] = true },
    soul_pos = {
        x = 7,
        y = 3
    },
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            local target_card = context.other_card
            return {
                func = function()
                    card:juice_up(10, 20)
                    return true
                end,
                extra = {
                    message = "SIX SEVEN!!! ",
                    colour = G.C.WHITE
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 6.7
            }
        end
    end
}