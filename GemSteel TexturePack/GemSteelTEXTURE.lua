--- STEAMODDED HEADER
--- MOD_NAME: GS_Texture
--- MOD_ID: GS
--- PREFIX: GStxt
--- MOD_AUTHOR: [Newcat07]
--- MOD_DESCRIPTION: Modified textures to be GEM and STEEL.
--- DEPENDENCIES: [malverk]

----------------------------------------------
------------MOD CODE -------------------------

local atlas_key = 'GStxt_Deck'
local atlas_path = 'GS_Deck.png'
local atlas_path_hc = nil
local suits = {'hearts', 'clubs', 'diamonds', 'spades'}
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace"}
local description = 'GemSteel Textures'

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false},
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false},
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end

-------------------------------------------
-------------------------------------------

AltTexture({ -- Decks
    key = 'GS_Back',
    set = 'Back',
    path = 'GS_Ench.png',
    loc_txt = {
        name = 'GS_Back'
    }
})
AltTexture({ -- Enchants
    key = 'GS_Ench',
    set = 'Enhanced',
    path = 'GS_Ench.png',
    keys = {  'm_bonus','m_mult','m_wild','m_glass','m_steel','m_gold','m_lucky','c_base'},
    original_sheet = true,
    loc_txt = {
        name = 'GS_Ench'
	}
})

TexturePack{
    key = 'GS_Skin',
    textures = {
        'GStxt_GS_Ench',
		'GStxt_GS_Back',
    },
    loc_txt = {
        name = 'GS_Texture',
        text = {
            'Modified textures to be',
            'SteelGem Themed'
        }
    }
}

----------------------------------------------
------------MOD CODE END----------------------