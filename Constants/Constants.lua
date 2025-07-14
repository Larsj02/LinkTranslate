local ADDON_NAME = ...
---@cast ADDON_NAME string

---@class AddonPrivate
local Private = select(2, ...)

local constants = {}

Private.constants = constants

constants.ADDON_NAME = ADDON_NAME
constants.ADDON_VERSION = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version")
constants.ADDON_MEDIA_PATH = [[Interface\AddOns\]] .. constants.ADDON_NAME .. [[\Media]]

constants.COLORS = {
    POSITIVE = CreateColorFromHexString("FF2ecc71"),
    NEUTRAL = CreateColorFromHexString("FFf1c40f"),
    NEGATIVE = CreateColorFromHexString("FFe74c3c"),
    WHITE = CreateColorFromHexString("FFecf0f1"),
    GREY = CreateColorFromHexString("FFbdc3c7"),
}
constants.MEDIA = {
    FONTS = {
        DEFAULT = constants.ADDON_MEDIA_PATH .. [[\Fonts\Default\NotoSans-Bold.ttf]],
    },
    TEXTURES = {
        LOGO = constants.ADDON_MEDIA_PATH .. [[\Textures\logo.tga]]
    }
}

constants.FONT_OBJECTS = {
    NORMAL = constants.ADDON_NAME .. 'Normal',
    HEADING = constants.ADDON_NAME .. 'Heading'
}

do
    local font = CreateFont(constants.FONT_OBJECTS.NORMAL)
    font:SetFont(constants.MEDIA.FONTS.DEFAULT, 12, "OUTLINE")
    font:SetJustifyH("LEFT")
    font:SetJustifyV("MIDDLE")
    font:SetTextColor(constants.COLORS.WHITE:GetRGBA())
end
do
    local font = CreateFont(constants.FONT_OBJECTS.HEADING)
    font:SetFont(constants.MEDIA.FONTS.DEFAULT, 16, "OUTLINE")
    font:SetJustifyH("LEFT")
    font:SetJustifyV("MIDDLE")
    font:SetTextColor(constants.COLORS.WHITE:GetRGBA())
end


constants.LINK_STRUCTURES = {
    achievement = { "achievementID", "guid", "completed", "month", "day", "year", "criteria1", "criteria2", "criteria3", "criteria4" },
    addon = { "name", "data" },
    api = { "type", "name", "parentName" },
    azessence = { "essenceID", "rank" },
    battlepet = { "speciesID", "level", "breedQuality", "maxHealth", "power", "speed", "battlePetID", "displayID" },
    battlePetAbil = { "abilityID", "maxHealth", "power", "speed" },
    calendarEvent = { "monthOffset", "monthDay", "index" },
    channel = { "channelType", "channelID" },
    clubFinder = { "clubFinderId" },
    clubTicket = { "ticketId" },
    community = { "clubId" },
    conduit = { "id", "rank" },
    currency = { "id", "amount" },
    death = { "recapID" },
    dungeonScore = { "score", "guid", "name", "classId", "itemLevel", "playerLevel", "runsThisSeason", "bestSeasonScore", "bestSeasonNumber", "mapChallengeModeID1", "completedInTime1", "keystoneLevel1", "mapChallengeModeID2", "completedInTime2", "keystoneLevel2", "mapChallengeModeID3", "completedInTime3", "keystoneLevel3", "mapChallengeModeID4", "completedInTime4", "keystoneLevel4", "mapChallengeModeID5", "completedInTime5", "keystoneLevel5", "mapChallengeModeID6", "completedInTime6", "keystoneLevel6", "mapChallengeModeID7", "completedInTime7", "keystoneLevel7", "mapChallengeModeID8", "completedInTime8", "keystoneLevel8", "mapChallengeModeID9", "completedInTime9", "keystoneLevel9", "mapChallengeModeID10", "completedInTime10", "keystoneLevel10" },
    enchant = { "spellID" },
    garrfollower = { "followerID", "quality", "level", "itemLevel", "ability1", "ability2", "ability3", "ability4", "trait1", "trait2", "trait3", "trait4", "spec1" },
    garrfollowerability = { "abilityID" },
    garrmission = { "missionID", "missionDBID" },
    instancelock = { "guid", "instanceID", "difficulty", "defeatedEncounters" },
    item = { "itemString" },
    journal = { "journalType", "journalID", "difficulty" },
    keystone = { "itemID", "challengeModeID", "level", "affix1", "affix2", "affix3", "affix4" },
    levelup = { "level", "levelUpType", "petName" },
    lootHistory = { "rollID" },
    mawpower = { "id" },
    outfit = { "payload" },
    player = { "name", "lineID", "chatType", "chatTarget" },
    playerCommunity = { "name", "communityClubID", "communityStreamID", "communityEpoch", "communityPosition" },
    BNplayer = { "name", "bnetIDAccount", "lineID", "chatType", "chatTarget" },
    BNplayerCommunity = { "name", "bnetIDAccount", "communityClubID", "communityStreamID", "communityEpoch", "communityPosition" },
    quest = { "questID", "questLevel", "unknown1", "unknown2", "unknown3" },
    spell = { "spellId", "glyphId", "event" },
    storecategory = { "category" },
    talent = { "talentID", "points" },
    talentbuild = { "specializationID", "level", "talentLoadoutImportString" },
    trade = { "guid", "spellID", "skillLineID" },
    transmogappearance = { "id" },
    transmogillusion = { "sourceID" },
    transmogset = { "setID" },
    unit = { "guid", "name" },
    urlIndex = { "index" },
    worldmap = { "uiMapID", "x", "y" },
}