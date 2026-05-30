
SMODS.Joker{ --Bossan
    key = "bossan",
    config = {
        extra = {
            bap = 0,
            currenthandsize = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bossan',
        ['text'] = {
            [1] = 'Changes your {C:attention}Joker{} slots',
            [2] = 'to your {C:attention}hand size{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
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
    pools = { ["arashi_leg_pets"] = true },
    soul_pos = {
        x = 4,
        y = 0
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
        
        return {vars = {card.ability.extra.bap, ((G.hand and G.hand.config.card_limit or 0) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "WOOF!", colour = G.C.BLUE})
                    G.jokers.config.card_limit = (G.hand and G.hand.config.card_limit or 0)
                    return true
                end
            }
        end
    end
}