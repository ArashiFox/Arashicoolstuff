
SMODS.Joker{ --Wrath
    key = "wrath",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Wrath',
        ['text'] = {
            [1] = 'Always spawns {C:legendary}Eternal{}',
            [2] = 'All played cards become {C:attention}Glass{}',
            [3] = 'Idea by {X:legendary,C:white}Ridry{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    scored_card:set_ability(G.P_CENTERS.m_glass)
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}