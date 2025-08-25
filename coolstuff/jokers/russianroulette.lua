SMODS.Joker{ --Russian Roulette
    key = "russianroulette",
    config = {
        extra = {
            num = 1,
            den = 6,
            Xmult = 3,
            odds = 1,
            mult = -30
        }
    },
    loc_txt = {
        ['name'] = 'Russian Roulette',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult',
            [2] = '{C:green}#1# in #2#{} chance for {C:red}-30{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, num, card.ability.extra.odds, 'j_arashi_russianroulette') 
        return {vars = {card.ability.extra.num, card.ability.extra.den, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.Xmult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_10699f92', 1, card.ability.extra.odds, 'j_arashi_russianroulette') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}