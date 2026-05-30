
SMODS.Joker{ --Jussegutten
    key = "jussegutten",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jussegutten',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X0.5{} Mult when a {C:attention}card{}',
            [2] = 'is {C:attention}bought, sold{} or {C:attention}used{}',
            [3] = '{C:inactive}(Currently {X:mult,C:white}X#1#{}{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
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
        x = 2,
        y = 3
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
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  then
            return {
                func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                    return true
                end
            }
        end
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                    return true
                end
            }
        end
        if context.using_consumeable  then
            return {
                func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.mult
            }
        end
    end
}