SMODS.Joker{ --Goku solos
    key = "gokusolos",
    config = {
        extra = {
            num = 1,
            den = 20,
            odds = 1,
            emult = 5000
        }
    },
    loc_txt = {
        ['name'] = 'Goku solos',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for{X:legendary,C:white} ^5000{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 30,
    rarity = "arashi_fucking_insane",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, num, card.ability.extra.odds, 'j_arashi_gokusolos') 
        return {vars = {card.ability.extra.num, card.ability.extra.den, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_52467de2', 1, card.ability.extra.odds, 'j_arashi_gokusolos') then
                      SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                  end
            end
        end
    end
}