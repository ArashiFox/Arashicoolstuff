
SMODS.Joker{ --Poppy
    key = "poppy",
    config = {
        extra = {
            bap = 0,
            totaljokerslots = 0
        }
    },
    loc_txt = {
        ['name'] = 'Poppy',
        ['text'] = {
            [1] = 'Sets your {C:tarot}Consumable{}',
            [2] = 'slots to your {C:attention}Joker slots{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["arashi_pet"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.bap, (G.jokers and G.jokers.config.card_limit or 0 or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.bap = G.jokers and G.jokers.config.card_limit or 0
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.bap = G.jokers and G.jokers.config.card_limit or 0
                    return true
                end
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        original_slots = G.consumeables.config.card_limit
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = card.ability.extra.bap
            return true
        end }))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        if original_slots then
            G.E_MANAGER:add_event(Event({func = function()
                G.consumeables.config.card_limit = original_slots
                return true
            end }))
        end
    end
}