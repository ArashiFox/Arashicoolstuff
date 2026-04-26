
SMODS.Joker{ --Water bottle
    key = "waterbottle",
    config = {
        extra = {
            chips = 150
        }
    },
    loc_txt = {
        ['name'] = 'Water bottle',
        ['text'] = {
            [1] = 'Gains {C:blue}+15{} Chips when Boss blind is defeated',
            [2] = 'Loses {C:blue}5{} Chips every hand played',
            [3] = '(Currently {C:blue}+#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["arashi_food"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.chips or 0)) == to_big(0) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_arashi_emptybottle' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            else
                card.ability.extra.chips = math.max(0, (card.ability.extra.chips) - 5)
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + 15
                    return true
                end,
                extra = {
                    message = "Refill!",
                    colour = G.C.BLUE
                }
            }
        end
    end
}