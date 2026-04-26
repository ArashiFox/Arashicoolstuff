
SMODS.Joker{ --Well this stinks
    key = "wellthisstinks",
    config = {
        extra = {
            xmult0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Well this stinks',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult',
            [2] = 'Is destroyed when a playing card is destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 5
            }
        end
        if context.remove_playing_cards  then
            return {
                func = function()
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Well, this stinks. (cries)", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
    end
}