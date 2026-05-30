
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
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.jokers and G.jokers.config.card_limit or 0
                        return true
                    end }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Woof.", colour = G.C.BLUE})
                    return true
                end
            }
        end
    end
}