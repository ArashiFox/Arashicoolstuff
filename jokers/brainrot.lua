
SMODS.Joker{ --Brainrotted joker
    key = "brainrot",
    config = {
        extra = {
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
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 6.7,
                message = "sIx sEvEn!"
            }
        end
        if context.hand_drawn  then
            return {
                message = "Jesterino Jimbolina!"
            }
        end
        if context.open_booster  then
            return {
                message = "Skibidi Joker!"
            }
        end
        if context.selling_self  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_arashi_brainrot' })
                            if joker_card then
                                
                                joker_card:add_sticker('eternal', true)
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Your not getting rid of me!", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.pseudorandom_result  then
            if context.result then
                return {
                    message = "ITS BECAUSE OF THE RESPAWN! HAIL SPAWNISM!"
                }
            end
        end
    end
}