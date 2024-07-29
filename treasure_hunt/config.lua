Config = {}

Config.Locale = 'en'

Config.TreasureLocations = {
    { x = 123.45, y = -567.89, z = 15.67 }, -- Example coordinates
    { x = 234.56, y = -678.90, z = 20.78 },
    { x = 345.67, y = -789.01, z = 25.89 }
}

Config.TreasureReward = {
    type = 'money',  -- 'money' or 'item'
    amount = 5000,   -- Amount of money or number of items
    itemName = 'gold_bar'  -- Item name if 'item' is selected
}

Config.TreasureCooldown = 600000 -- Cooldown in milliseconds (600000 ms = 10 minutes)
