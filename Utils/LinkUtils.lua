---@class AddonPrivate
local Private = select(2, ...)

local const = Private.constants or {}
local addon = Private.Addon or {}

---@diagnostic disable-next-line: undefined-field
local linkUtil = _G.LinkUtil or {}

---@class LinkObjectBase
---@field type HyperlinkType
---@field options string
---@field text string

---@class AchievementLinkObject : LinkObjectBase
---@field achievementID number -- Achievement ID
---@field guid string -- Player GUID
---@field completed number -- 0 or 1
---@field month number -- Month of completion
---@field day number -- Day of completion
---@field year number -- Year of completion
---@field criteria1 number -- 32-bit bitmask fields for completed criteria, or 0 if not completed.
---@field criteria2 number -- 32-bit bitmask fields for completed criteria, or 0 if not completed.
---@field criteria3 number -- 32-bit bitmask fields for completed criteria, or 0 if not completed.
---@field criteria4 number -- 32-bit bitmask fields for completed criteria, or 0 if not completed.

---@class AddonLinkObject : LinkObjectBase
---@field name string -- Addon name
---@field data string -- Arbitrary colon-delimited addon data segments.

---@class ApiLinkObject : LinkObjectBase
---@field type string -- API type
---@field name string -- API name
---@field parentName string -- Parent API name, if applicable

---@class AzessenceLinkObject : LinkObjectBase
---@field essenceID number -- Essence ID
---@field rank number -- Essence rank

---@class BattlepetLinkObject : LinkObjectBase
---@field speciesID number -- Species ID
---@field level number -- Pet level
---@field breedQuality number -- Breed quality
---@field maxHealth number -- Maximum health
---@field power number -- Power stat
---@field speed number -- Speed stat
---@field battlePetID string -- Battle pet ID
---@field displayID number -- Display ID

---@class BattlePetAbilLinkObject : LinkObjectBase
---@field abilityID number -- Ability ID
---@field maxHealth number -- Maximum health
---@field power number -- Power stat
---@field speed number -- Speed stat

---@class CalendarEventLinkObject : LinkObjectBase
---@field monthOffset number -- Month offset
---@field monthDay number -- Month day
---@field index number -- Index

---@class ChannelLinkObject : LinkObjectBase
---@field channelType string -- Channel type
---@field channelID string -- Channel ID

---@class ClubFinderLinkObject : LinkObjectBase
---@field clubFinderId string -- Club finder ID

---@class ClubTicketLinkObject : LinkObjectBase
---@field ticketId string -- Ticket ID

---@class CommunityLinkObject : LinkObjectBase
---@field clubId string -- Club ID

---@class ConduitLinkObject : LinkObjectBase
---@field id number -- Conduit ID
---@field rank number -- Conduit rank

---@class CurrencyLinkObject : LinkObjectBase
---@field id number -- Currency ID
---@field amount number -- Currency amount

---@class DeathLinkObject : LinkObjectBase
---@field recapID string -- Recap ID

---@class DungeonScoreLinkObject : LinkObjectBase
---@field score number -- Dungeon score
---@field guid string -- Player GUID
---@field name string -- Player name
---@field classId number -- Class ID
---@field itemLevel number -- Item level
---@field playerLevel number -- Player level
---@field runsThisSeason number -- Runs this season
---@field bestSeasonScore number -- Best season score
---@field bestSeasonNumber number -- Best season number
---@field mapChallengeModeID1 number -- Map challenge mode ID 1
---@field completedInTime1 number -- Completed in time 1
---@field keystoneLevel1 number -- Keystone level 1
---@field mapChallengeModeID2 number -- Map challenge mode ID 2
---@field completedInTime2 number -- Completed in time 2
---@field keystoneLevel2 number -- Keystone level 2
---@field mapChallengeModeID3 number -- Map challenge mode ID 3
---@field completedInTime3 number -- Completed in time 3
---@field keystoneLevel3 number -- Keystone level 3
---@field mapChallengeModeID4 number -- Map challenge mode ID 4
---@field completedInTime4 number -- Completed in time 4
---@field keystoneLevel4 number -- Keystone level 4
---@field mapChallengeModeID5 number -- Map challenge mode ID 5
---@field completedInTime5 number -- Completed in time 5
---@field keystoneLevel5 number -- Keystone level 5
---@field mapChallengeModeID6 number -- Map challenge mode ID 6
---@field completedInTime6 number -- Completed in time 6
---@field keystoneLevel6 number -- Keystone level 6
---@field mapChallengeModeID7 number -- Map challenge mode ID 7
---@field completedInTime7 number -- Completed in time 7
---@field keystoneLevel7 number -- Keystone level 7
---@field mapChallengeModeID8 number -- Map challenge mode ID 8
---@field completedInTime8 number -- Completed in time 8
---@field keystoneLevel8 number -- Keystone level 8
---@field mapChallengeModeID9 number -- Map challenge mode ID 9
---@field completedInTime9 number -- Completed in time 9
---@field keystoneLevel9 number -- Keystone level 9
---@field mapChallengeModeID10 number -- Map challenge mode ID 10
---@field completedInTime10 number -- Completed in time 10
---@field keystoneLevel10 number -- Keystone level 10

---@class EnchantLinkObject : LinkObjectBase
---@field spellID number -- Spell ID

---@class GarrfollowerLinkObject : LinkObjectBase
---@field followerID number -- Follower ID
---@field quality number -- Quality
---@field level number -- Level
---@field itemLevel number -- Item level
---@field ability1 number -- Ability 1
---@field ability2 number -- Ability 2
---@field ability3 number -- Ability 3
---@field ability4 number -- Ability 4
---@field trait1 number -- Trait 1
---@field trait2 number -- Trait 2
---@field trait3 number -- Trait 3
---@field trait4 number -- Trait 4
---@field spec1 number -- Specialization 1

---@class GarrfollowerabilityLinkObject : LinkObjectBase
---@field abilityID number -- Ability ID

---@class GarrmissionLinkObject : LinkObjectBase
---@field missionID number -- Mission ID
---@field missionDBID number -- Mission database ID

---@class InstancelockLinkObject : LinkObjectBase
---@field guid string -- Instance GUID
---@field instanceID number -- Instance ID
---@field difficulty number -- Difficulty
---@field defeatedEncounters number -- Defeated encounters

---@class ItemLinkObject : LinkObjectBase
---@field itemString string -- Item string

---@class JournalLinkObject : LinkObjectBase
---@field journalType string -- Journal type
---@field journalID number -- Journal ID
---@field difficulty number -- Difficulty

---@class KeystoneLinkObject : LinkObjectBase
---@field itemID number -- Item ID
---@field challengeModeID number -- Challenge mode ID
---@field level number -- Keystone level
---@field affix1 number -- Affix 1
---@field affix2 number -- Affix 2
---@field affix3 number -- Affix 3
---@field affix4 number -- Affix 4

---@class LevelupLinkObject : LinkObjectBase
---@field level number -- Level
---@field levelUpType string -- Level up type
---@field petName string -- Pet name

---@class LootHistoryLinkObject : LinkObjectBase
---@field rollID number -- Roll ID

---@class MawpowerLinkObject : LinkObjectBase
---@field id number -- Maw power ID

---@class OutfitLinkObject : LinkObjectBase
---@field payload string -- Outfit payload

---@class PlayerLinkObject : LinkObjectBase
---@field name string -- Player name
---@field lineID number -- Line ID
---@field chatType string -- Chat type
---@field chatTarget string -- Chat target

---@class PlayerCommunityLinkObject : LinkObjectBase
---@field name string -- Player name
---@field communityClubID string -- Community club ID
---@field communityStreamID string -- Community stream ID
---@field communityEpoch number -- Community epoch
---@field communityPosition number -- Community position

---@class BNplayerLinkObject : LinkObjectBase
---@field name string -- Player name
---@field bnetIDAccount string -- Battle.net ID account
---@field lineID number -- Line ID
---@field chatType string -- Chat type
---@field chatTarget string -- Chat target

---@class BNplayerCommunityLinkObject : LinkObjectBase
---@field name string -- Player name
---@field bnetIDAccount string -- Battle.net ID account
---@field communityClubID string -- Community club ID
---@field communityStreamID string -- Community stream ID
---@field communityEpoch number -- Community epoch
---@field communityPosition number -- Community position

---@class QuestLinkObject : LinkObjectBase
---@field questID number -- Quest ID
---@field questLevel number -- Quest level
---@field unknown1 number -- Unknown parameter 1
---@field unknown2 number -- Unknown parameter 2
---@field unknown3 number -- Unknown parameter 3

---@class SpellLinkObject : LinkObjectBase
---@field spellId number -- Spell ID
---@field glyphId number -- Glyph ID
---@field event string -- Event

---@class StorecategoryLinkObject : LinkObjectBase
---@field category string -- Store category

---@class TalentLinkObject : LinkObjectBase
---@field talentID number -- Talent ID
---@field points number -- Points

---@class TalentbuildLinkObject : LinkObjectBase
---@field specializationID number -- Specialization ID
---@field level number -- Level
---@field talentLoadoutImportString string -- Talent loadout import string

---@class TradeLinkObject : LinkObjectBase
---@field guid string -- GUID
---@field spellID number -- Spell ID
---@field skillLineID number -- Skill line ID

---@class TransmogappearanceLinkObject : LinkObjectBase
---@field id number -- Transmog appearance ID

---@class TransmogillusionLinkObject : LinkObjectBase
---@field sourceID number -- Source ID

---@class TransmogsetLinkObject : LinkObjectBase
---@field setID number -- Set ID

---@class UnitLinkObject : LinkObjectBase
---@field guid string -- Unit GUID
---@field name string -- Unit name

---@class UrlIndexLinkObject : LinkObjectBase
---@field index number -- URL index

---@class WorldmapLinkObject : LinkObjectBase
---@field uiMapID number -- UI map ID
---@field x number -- X coordinate
---@field y number -- Y coordinate

---@alias LinkObject AchievementLinkObject|AddonLinkObject|ApiLinkObject|AzessenceLinkObject|BattlepetLinkObject|BattlePetAbilLinkObject|CalendarEventLinkObject|ChannelLinkObject|ClubFinderLinkObject|ClubTicketLinkObject|CommunityLinkObject|ConduitLinkObject|CurrencyLinkObject|DeathLinkObject|DungeonScoreLinkObject|EnchantLinkObject|GarrfollowerLinkObject|GarrfollowerabilityLinkObject|GarrmissionLinkObject|InstancelockLinkObject|ItemLinkObject|JournalLinkObject|KeystoneLinkObject|LevelupLinkObject|LootHistoryLinkObject|MawpowerLinkObject|OutfitLinkObject|PlayerLinkObject|PlayerCommunityLinkObject|BNplayerLinkObject|BNplayerCommunityLinkObject|QuestLinkObject|SpellLinkObject|StorecategoryLinkObject|TalentLinkObject|TalentbuildLinkObject|TradeLinkObject|TransmogappearanceLinkObject|TransmogillusionLinkObject|TransmogsetLinkObject|UnitLinkObject|UrlIndexLinkObject|WorldmapLinkObject

---@class LinkUtils
local linkUtils = {}
Private.LinkUtils = linkUtils

---@param link string
---@return LinkObject?
function linkUtils:GetLinkObj(link)
    local linkType, linkOptions, displayText = linkUtil.ExtractLink(link)
    if not linkType then return nil end

    local linkObj = {
        type = linkType,
        options = linkOptions or "",
        text = displayText or "",
    }

    local linkStructure = const.LINK_STRUCTURES[linkType]
    local optionsList = { linkUtil.SplitLinkOptions(linkOptions or "") }
    for i, value in ipairs(optionsList) do
        linkObj[linkStructure[i]] = value
    end

    return linkObj
end

---@param linkObj LinkObject
---@return boolean? success, string? link
function linkUtils:RebuildLink(linkObj)
    if not linkObj or not linkObj.type then return end
    local translated = linkObj.text or ""

    if linkObj.type == "achievement" then
        ---@cast linkObj AchievementLinkObject
        local achievementName = self:GetAchievementName(linkObj.achievementID)
        if achievementName then translated = achievementName end
    elseif linkObj.type == "azessence" then
        ---@cast linkObj AzessenceLinkObject
        local essenceName = self:GetEssenceName(linkObj.essenceID, linkObj.rank)
        if essenceName then translated = essenceName end
    elseif linkObj.type == "battlepet" then
        ---@cast linkObj BattlepetLinkObject
        local petName = self:GetBattlePetName(linkObj.speciesID)
        if petName then translated = petName end
    elseif linkObj.type == "battlePetAbil" then
        ---@cast linkObj BattlePetAbilLinkObject
        local abilityName = self:GetBattlePetAbilityName(linkObj.abilityID)
        if abilityName then translated = abilityName end
    elseif linkObj.type == "conduit" then
        ---@cast linkObj ConduitLinkObject
        local conduitName = self:GetConduitName(linkObj.id, linkObj.rank)
        if conduitName then translated = conduitName end
    elseif linkObj.type == "currency" then
        ---@cast linkObj CurrencyLinkObject
        local currencyName = self:GetCurrencyName(linkObj.id)
        if currencyName then translated = currencyName end
        -- TODO: Continue from dungeonScore
    end

    return true, LinkUtil.FormatLink(linkObj.type, translated, linkObj.options)
end

---@param achievementID number
---@return string?
function linkUtils:GetAchievementName(achievementID)
    if not achievementID then return end
    return select(2, GetAchievementInfo(achievementID))
end

---@param essenceID number
---@param rank number?
---@return string?
function linkUtils:GetEssenceName(essenceID, rank)
    if not essenceID then return end
    if not rank then rank = 1 end
    local data = C_TooltipInfo.GetAzeriteEssence(essenceID, rank)
    if not data then return end
    return data.lines and data.lines[1] and data.lines[1].leftText or nil
end

---@param speciesID number
---@return string?
function linkUtils:GetBattlePetName(speciesID)
    if not speciesID then return end
    local name = C_PetJournal.GetPetInfoBySpeciesID(2032)
    return name
end

---@param abilityID number
---@return string?
function linkUtils:GetBattlePetAbilityName(abilityID)
    if not abilityID then return end
    local name = C_PetJournal.GetPetAbilityInfo(abilityID)
    return name
end

---@param conduitID number
---@param rank number?
---@return string?
function linkUtils:GetConduitName(conduitID, rank)
    if not conduitID then return end
    if not rank then rank = 1 end
    local data = C_TooltipInfo.GetConduit(conduitID, rank)
    if not data then return end
    return data.lines and data.lines[1] and data.lines[1].leftText or nil
end

---@param currencyID number
---@return string?
function linkUtils:GetCurrencyName(currencyID)
    if not currencyID then return end
    local info = C_CurrencyInfo.GetCurrencyInfo(currencyID)
    if not info then return end
    return info.name
end