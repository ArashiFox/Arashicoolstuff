
SMODS.Joker{ --Trade Offer
    key = "tradeoffer",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Trade Offer',
        ['text'] = {
            [1] = 'When a {C:rare}Rare{} Joker is sold,',
            [2] = '{C:inactive}(Including self),',
            [3] = '{}create a {C:enhanced}Glass {}{C:red}Red Seal{}',
            [4] = '{C:edition}Polychrome{} {C:attention}Playing Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
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
    pools = { ["arashi_arashi_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_card  then
            if #G.jokers.highlighted > 0 and G.jokers.highlighted[1]:is_rarity("Rare") then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal("Red", true)
                
                base_card:set_edition("e_polychrome", true)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end,
                    message = "Added Card!"
                }
            end
        end
    end
}