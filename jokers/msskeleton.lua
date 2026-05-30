
SMODS.Joker{ --Ms. Skeleton
    key = "msskeleton",
    config = {
        extra = {
            odds = 2,
            odds2 = 9
        }
    },
    loc_txt = {
        ['name'] = 'Ms. Skeleton',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to prevent death,',
            [2] = '{C:green}1 in 9{} chance to self destruct'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["arashi_arashi_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 4
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_arashi_msskeleton')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_arashi_msskeleton')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b0a13bc3', 1, card.ability.extra.odds, 'j_arashi_msskeleton', false) then
                    SMODS.calculate_effect({saved = true}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_saved_ex'), colour = G.C.RED})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_977aface', 1, card.ability.extra.odds2, 'j_arashi_msskeleton', false) then
                    SMODS.calculate_effect({func = function()
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
                        return true
                    end}, card)
                end
            end
        end
    end
}