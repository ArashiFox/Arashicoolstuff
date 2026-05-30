
SMODS.Joker{ --Adam Jonkler
    key = "click",
    config = {
        extra = {
            xmult = 2.4,
            dollars0 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Adam Jonkler',
        ['text'] = {
            [1] = 'When {C:attention}blind{} is {C:attention}skipped{},',
            [2] = 'gain {C:money}$15{}',
            [3] = 'but lose {X:red,C:white}X0.2{} Mult',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            if to_big(card.ability.extra.xmult) <= to_big(1) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Life wasted!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.xmult = math.max(0, (card.ability.extra.xmult) - 0.2)
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 15
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(15), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}