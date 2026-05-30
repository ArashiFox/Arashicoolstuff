
SMODS.Joker{ --Envy
    key = "envy",
    config = {
        extra = {
            chips = 0,
            mult = 0,
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Envy',
        ['text'] = {
            [1] = 'Always spawns {C:legendary}Eternal{}',
            [2] = 'When a card with {C:edition}Polychrome,',
            [3] = 'Holographic, or Foil{}',
            [4] = 'is played, remove it\'s {C:dark_edition}Edition{}',
            [5] = 'and add its effect to this joker',
            [6] = '(Currently {C:blue}+#1#{} Chips,',
            [7] = '{C:red}+#2#{} Mult, and {X:red,C:white}X#3#{} Mult)',
            [8] = 'Credits to {X:legendary,C:white}Ridry{} for idea'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 0
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card.edition and context.other_card.edition.key == "e_foil" then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition(nil)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.chips = (card.ability.extra.chips) + 50
            elseif context.other_card.edition and context.other_card.edition.key == "e_holo" then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition(nil)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.mult = (card.ability.extra.mult) + 10
            elseif context.other_card.edition and context.other_card.edition.key == "e_polychrome" then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition(nil)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.xmult = (card.ability.extra.xmult) * 1.5
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips,
                extra = {
                    mult = card.ability.extra.mult,
                    extra = {
                        Xmult = card.ability.extra.xmult
                    }
                }
            }
        end
    end
}