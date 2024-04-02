local playerIdentifiers = {}

-- Function to get player IDs
function GetPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        table.insert(players, player)
    end
    return players
end

-- Function to retrieve player identifiers and store them in a table
function GetPlayerIdentifiers(player)
    local identifiers = GetPlayerIdentifiers(player) -- Call the appropriate function to get player identifiers
    local idTable = {}

    for _, identifier in ipairs(identifiers) do
        local parts = splitString(identifier, ":")
        local idType = parts[1]
        local idValue = parts[2]
        idTable[idType] = idValue
    end

    return idTable
end

-- Function to split a string by a delimiter
function splitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end

    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end

    return t
end

-- Function to print player identifiers sorted by type
function printIdentifiersSortedByType()
    for _, player in ipairs(GetPlayers()) do
        local identifiers = GetPlayerIdentifiers(player)
        for idType, idValue in pairs(identifiers) do
            if not playerIdentifiers[idType] then
                playerIdentifiers[idType] = {}
            end
            table.insert(playerIdentifiers[idType], idValue)
        end
    end

    -- Print identifiers sorted by type
    for idType, idValues in pairs(playerIdentifiers) do
        print("Type: " .. idType)
        for _, idValue in ipairs(idValues) do
            print("- " .. idValue)
        end
    end
end

-- Call the function to print identifiers sorted by type
printIdentifiersSortedByType()
