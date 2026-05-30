
SMODS.Joker{ --Yapchat Filter
    key = "yapchatfilter",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Yapchat Filter',
        ['text'] = {
            [1] = '{C:green}1{} in {C:green}3{} chance to apply',
            [2] = 'a random {C:attention}enhancement{}',
            [3] = 'to every scored {C:attention}playing card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
    pools = { ["arashi_arashi_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_arashi_yapchatfilter') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) then
                if SMODS.pseudorandom_probability(card, 'group_0_1df38129', 1, card.ability.extra.odds, 'j_arashi_yapchatfilter', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            local enhancement_pool = {}
                            for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                                if enhancement.key ~= 'm_stone' then
                                    enhancement_pool[#enhancement_pool + 1] = enhancement
                                end
                            end
                            local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                            scored_card:set_ability(random_enhancement)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}