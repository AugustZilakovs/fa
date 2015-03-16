local WatchedValueTable = import('/lua/ui/lobby/data/watchedvalue/watchedvaluetable.lua').WatchedValueTable

-- The default values (and the only valid keyset) for a PlayerData object.
local DEFAULT_MAPPING = {
    Team = 1,
    -- Both PlayerColor and ArmyColor must be set for the game to start.
    -- This is retarded.
    PlayerColor = 1,
    ArmyColor = 1,
    StartSpot = 1,
    Ready = false,
    Faction = table.getn(import('/lua/factions.lua').Factions) + 1, -- Random faction
    PlayerClan = "",
    PlayerName = "player",
    AIPersonality = "",
    Human = true,
    Civilian = false,
    OwnerID = false,
    BadMap = false,
    ObserverListIndex = -1,

    -- Rating stuff. Perhaps wants its own table? Definitely wants renaming.
    MEAN = 0,
    DEV = 0,
    PL = 0,  -- Rating
    RC = "ffffffff",  -- Rating colour
    NG = 0,  -- Number of games.

    Country = false,
}

-- Represents player data using the magic of lazy variables.
PlayerData = Class(WatchedValueTable) {
    -- Create a new PlayerData object for the given player name.
    __init = function(self, initialMapping)
        local mapping = table.assimilate(initialMapping, DEFAULT_MAPPING)
        mapping.ArmyColor = mapping.PlayerColor
        table.print(mapping)
        WatchedValueTable.__init(self, mapping)
    end
}
