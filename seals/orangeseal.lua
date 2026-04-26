
SMODS.Seal {
    key = 'orangeseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            card_draw0 = 1
        }
    },
    badge_colour = HEX('ff9b0d'),
    loc_txt = {
        name = 'Orange seal',
        label = 'Orange seal',
        text = {
            [1] = 'When this card is scored',
            [2] = 'Draw a random card to your hand'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(1)
            end
            return {
                message = "+"..tostring(1).." Cards Drawn"
            }
        end
    end
}