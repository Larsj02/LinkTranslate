---@class AddonPrivate
local Private = select(2, ...)

local const = Private.constants
local addon = Private.Addon

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
        if linkType == "item" then
            linkObj.itemString = link
            break
        elseif linkType == "addon" and i > 1 then
            linkObj[linkStructure[2]] = linkObj[linkStructure[2]] or {}
            tinsert(linkObj[linkStructure[2]], value)
        else
            linkObj[linkStructure[i]] = value
        end
    end

    return linkObj
end

---@param linkObj LinkObject
---@param callback fun(newLink: string)
function linkUtils:RebuildLink(linkObj, callback)
    if not linkObj or not linkObj.type then return end
    local translated = linkObj.text or ""

    local rebuildCallback = function(newName)
        if linkObj.text ~= newName then
            newName = ("[%s]"):format(newName)
        end
        callback(LinkUtil.FormatLink(linkObj.type, newName, linkObj.options))
    end

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
    elseif linkObj.type == "dungeonScore" then
        ---@cast linkObj DungeonScoreLinkObject
        translated = DUNGEON_SCORE
    elseif linkObj.type == "enchant" then
        ---@cast linkObj EnchantLinkObject
        self:GetAsyncEnchantName(linkObj.spellID, rebuildCallback)
        return
    elseif linkObj.type == "garrfollower" then
        ---@cast linkObj GarrfollowerLinkObject
        local followerName = self:GetFollowerName(linkObj.followerID)
        if followerName then translated = followerName end
    elseif linkObj.type == "garrfollowerability" then
        ---@cast linkObj GarrfollowerabilityLinkObject
        local followerAbilityName = self:GetFollowerAbilityName(linkObj.abilityID)
        if followerAbilityName then translated = followerAbilityName end
    elseif linkObj.type == "garrmission" then
        ---@cast linkObj GarrmissionLinkObject
        local missionName = self:GetMissionName(linkObj.missionID)
        if missionName then translated = missionName end
    elseif linkObj.type == "instancelock" then
        ---@cast linkObj InstancelockLinkObject
        local instanceName = self:GetInstanceName(linkObj.instanceID)
        if instanceName then translated = instanceName end
    elseif linkObj.type == "item" then
        ---@cast linkObj ItemLinkObject
        self:GetAsyncItemName(linkObj.itemString, rebuildCallback)
        return
    elseif linkObj.type == "journal" then
        ---@cast linkObj JournalLinkObject
        local journalName = self:GetJournalName(linkObj.journalType, linkObj.journalID)
        if journalName then translated = journalName end
    elseif linkObj.type == "keystone" then
        ---@cast linkObj KeystoneLinkObject
        local keystoneName = self:GetKeystoneName(linkObj.challengeModeID, linkObj.level)
        if keystoneName then translated = keystoneName end
    elseif linkObj.type == "levelup" then
        ---@cast linkObj LevelupLinkObject
        translated = LEVEL_GAINED:format(linkObj.level)
    elseif linkObj.type == "mawpower" then
        ---@cast linkObj MawpowerLinkObject
        self:GetAsyncMawPowerName(linkObj.id, rebuildCallback)
        return
    elseif linkObj.type == "quest" then
        ---@cast linkObj QuestLinkObject
        self:GetAsyncQuestName(linkObj.questID, rebuildCallback)
        return
    elseif linkObj.type == "spell" then
        ---@cast linkObj SpellLinkObject
        self:GetAsyncSpellName(linkObj.spellId, rebuildCallback)
        return
    elseif linkObj.type == "talent" then
        ---@cast linkObj TalentLinkObject
        local talentName = self:GetTalentName(linkObj.talentID)
        if talentName then translated = talentName end
    elseif linkObj.type == "trade" then
        ---@cast linkObj TradeLinkObject
        local tradeskillName = self:GetTradeskillName(linkObj.skillLineID)
        if tradeskillName then translated = tradeskillName end
    elseif linkObj.type == "transmogappearance" then
        ---@cast linkObj TransmogappearanceLinkObject
        self:GetAsyncTransmogappearanceName(linkObj.id, rebuildCallback)
        return
    elseif linkObj.type == "transmogillusion" then
        ---@cast linkObj TransmogillusionLinkObject
        local transmogillusionName = self:GetTransmogillusionName(linkObj.sourceID)
        if transmogillusionName then translated = transmogillusionName end
    elseif linkObj.type == "transmogset" then
        ---@cast linkObj TransmogsetLinkObject
        local transmogsetName = self:GetTransmogsetName(linkObj.setID)
        if transmogsetName then translated = transmogsetName end
    elseif linkObj.type == "worldmap" then
        ---@cast linkObj WorldmapLinkObject
        translated = MAP_PIN_HYPERLINK
    end

    rebuildCallback(translated)
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
    local name = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
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

function linkUtils:GetFollowerName(followerID)
    if not followerID then return end
    local follower = C_Garrison.GetFollowerInfo(followerID)
    if not follower then return end
    return follower.name
end

function linkUtils:GetFollowerAbilityName(abilityID)
    if not abilityID then return end
    return C_Garrison.GetFollowerAbilityName(abilityID)
end

function linkUtils:GetMissionName(missionID)
    if not missionID then return end
    return C_Garrison.GetMissionName(missionID)
end

function linkUtils:GetInstanceName(instanceID)
    if not instanceID then return end
    local journalInstanceID = C_EncounterJournal.GetInstanceForGameMap(instanceID)
    if not journalInstanceID then return end
    local instanceName = EJ_GetInstanceInfo(journalInstanceID)
    return instanceName
end

function linkUtils:GetJournalName(journalType, journalID)
    if not (journalType and journalID) then return end
    local instanceID, encounterID, sectionID = EJ_HandleLinkPath(journalType, journalID)
    if sectionID then
        local sectionInfo = C_EncounterJournal.GetSectionInfo(sectionID)
        if not sectionInfo then return end
        return sectionInfo.title
    end
    if encounterID then
        local encounterName = EJ_GetEncounterInfo(encounterID)
        return encounterName
    end
    if instanceID then
        local instanceName = EJ_GetInstanceInfo(instanceID)
        return instanceName
    end
end

function linkUtils:GetKeystoneName(challengeModeID, level)
    if not (challengeModeID and level) then return end
    local mapName = C_ChallengeMode.GetMapUIInfo(challengeModeID)
    if not mapName then return end
    return CHALLENGE_MODE_KEYSTONE_HYPERLINK:format(mapName, level)
end

function linkUtils:GetTalentName(talentID)
    if not talentID then return end
    ---@diagnostic disable-next-line: missing-parameter
    local _, name = GetTalentInfoByID(talentID)
    return name
end

function linkUtils:GetTradeskillName(skillLineID)
    if not skillLineID then return end
    return C_TradeSkillUI.GetTradeSkillDisplayName(skillLineID)
end

function linkUtils:GetTransmogillusionName(illusionID)
    if not illusionID then return end
    local name = C_TransmogCollection.GetIllusionStrings(illusionID)
    return name
end

function linkUtils:GetTransmogsetName(setID)
    if not setID then return end
    local set = C_TransmogSets.GetSetInfo(setID)
    if not set then return end
    return set.name
end

function linkUtils:GetAsyncEnchantName(spellID, callback)
    if not tonumber(spellID) then return end
    spellID = tonumber(spellID)
    local professionInfo = C_TradeSkillUI.GetProfessionInfoByRecipeID(spellID)
    local profName = professionInfo.professionName or ""
    self:GetAsyncSpellName(spellID, function (spellName)
        local translated = ("%s: %s"):format(profName, spellName)
        callback(translated)
    end)
end

function linkUtils:GetAsyncItemName(itemString, callback)
    local item = Item:CreateFromItemLink(itemString)

    item:ContinueOnItemLoad(function()
        callback(item:GetItemName())
    end)
end

function linkUtils:GetAsyncQuestName(questID, callback)
    if not tonumber(questID) then return end
    questID = tonumber(questID)
    QuestEventListener:AddCallback(questID, function()
        callback(C_QuestLog.GetTitleForQuestID(questID))
    end)
    C_QuestLog.RequestLoadQuestByID(questID)
end

function linkUtils:GetAsyncMawPowerName(powerID, callback)
    if not tonumber(powerID) then return end
    local spellID = const.MAW_POWERS[tonumber(powerID)]
    self:GetAsyncSpellName(spellID, callback)
end

function linkUtils:GetAsyncSpellName(spellID, callback)
    if not tonumber(spellID) then return end
    spellID = tonumber(spellID)
    local spell = Spell:CreateFromSpellID(spellID)

    spell:ContinueOnSpellLoad(function()
        callback(spell:GetSpellName())
    end)
end

function linkUtils:GetAsyncTransmogappearanceName(itemModifiedAppearanceID, callback)
    if not tonumber(itemModifiedAppearanceID) then return end
    itemModifiedAppearanceID = tonumber(itemModifiedAppearanceID)
    local itemID = C_Transmog.GetItemIDForSource(itemModifiedAppearanceID)
    local item = Item:CreateFromItemID(itemID)

    item:ContinueOnItemLoad(function()
        callback(item:GetItemName())
    end)
end