---@class AddonPrivate
local Private = select(2, ...)

local linkUtils = Private.LinkUtils or {}

---@class ChatUtils
local chatUtils = {
    messageQueue = {}
}
Private.ChatUtils = chatUtils

local function escape_lua_pattern(s)
   return s:gsub("([%%%^%$%(%)%.%[%]%*%+%-%?])", "%%%1")
end

function chatUtils:GetLinks(msg)
    local links = {}
    for link in msg:gmatch("|H.-|h.-|h") do
        tinsert(links, link)
    end
    return links
end

function chatUtils:MessageQueueCallback(guid, oldLink, newLink)
    local queueObj = self.messageQueue[guid]
    if not queueObj then return end

    queueObj.translations[oldLink] = newLink
    for link, translated in pairs(queueObj.translations) do
        if not translated then return end
        queueObj.msg = queueObj.msg:gsub(escape_lua_pattern(link), translated)
    end

    self.messageQueue[guid] = nil
    queueObj.send(queueObj.msg)
end

function chatUtils:AddMessageToQueue(msg, links, send)
    local guid = Private.GUIDUtils:GenerateGUID()

    local translations = {}
    local queueObj = {
        msg = msg,
        send = send,
        translations = translations
    }
    self.messageQueue[guid] = queueObj
    for _, link in ipairs(links) do
        translations[link] = false
        local linkObj = linkUtils:GetLinkObj(link)
        if linkObj then
            linkUtils:RebuildLink(linkObj, function(newLink)
                self:MessageQueueCallback(guid, link, newLink)
            end)
        end
    end
end

function chatUtils:AsyncFilterAndSend(msg, send)
    if type(msg) == "string" then
        msg = "[DEV] " .. msg
    end
    local links = self:GetLinks(msg)
    if #links > 0 then
        self:AddMessageToQueue(msg, links, send)
        return
    end

    send(msg)
end

function chatUtils:GetReplacementFunction(sendFunc)
    return function(frame, msg, ...)
        local args = {...}
        self:AsyncFilterAndSend(msg, function(newMsg)
            sendFunc(frame, newMsg, unpack(args))
        end)
    end
end

function chatUtils:ReplaceChatFunctions()
    for i = 1, 100 do
        local frame = _G["ChatFrame" .. i]
        if frame then
            local addMessage = frame.AddMessage
            frame.AddMessage = self:GetReplacementFunction(addMessage)
        end
    end
    local addMessage = ChatFrame_AddMessage
    ChatFrame_AddMessage = self:GetReplacementFunction(addMessage)
end

function chatUtils:SendTestLinks()
    local testLinks = {
        "|cffffff00|Hachievement:12544:Player-1096-06DF65C1:0:0:0:-1:0:0:0:0|h[Level 120]|h|r",
        "|cff71d5ff|Haddon:SuperAuras:some:data:1234|h[SuperAuras: The Link!]|h|r",
        "|cffff55dd|Hapi:system:MapUI:|hMapUI|h|r",
        "|cffa335ee|Hazessence:12:3|h[The Crucible of Flame]|h|r",
        "|cff0070dd|Hbattlepet:202:25:3:1546:289:260:BattlePet-0-00000338F951:16189|h[Baby Blizzard Bear]|h|r",
        "|cff4e96f7|HbattlePetAbil:348:1435:267:240|hBash|h|r",
        "|HcalendarEvent:0:12:1|hSpring Balloon Festival|h",
        "|Hchannel:channel:2|h[2. Trade - City]|h",
        "|cffffd100|HclubFinder:ClubFinder-1-19160-1598-53720920|h[Guild: Happy Leveling]|h|r",
        "|cffffd100|HclubTicket:oxPbMfv2R|h[Join: test]|h|r",
        "|cff71d5ff|Hconduit:5:1|h[Stalwart Guardian]|h|r",
        "|cffffffff|Hcurrency:1744|h[Corrupted Memento]|h|r",
        "|Hdeath:1|h[You died.]|h",
        "|cffffd100|HdungeonScore:2723:Player-1403-068056BB:Numedain:6:278:60:124:2723:3:381:1:15:382:1:17:392:1:18:391:1:18:380:1:17:375:1:18:376:0:18:377:1:17:378:1:19:379:1:16|h[Mythic+ Rating]|h|r",
        "|cffffd000|Henchant:162206|h[Draenor Engineering: World Shrinker]|h|r",
        "|cffa335ee|Hgarrfollower:856:4:110:900:457:777:0:0:684:758:0:0:354|h[Calia Menethil]|h|r",
        "|cff4e96f7|Hgarrfollowerability:354|h[Discipline]|h|r",
        "|cffffff00|Hgarrmission:1610:000000000238f82d|h[Withered Straining]|h|r",
        "|cffff8000|Hinstancelock:Player-3296-000957C8:543:2:4|h[Hellfire Citadel: Ramparts]|h|r",
        "|cffffffff|Hitem:2592::::::::::::::::::|h[Wool Cloth]|h|r",
        "|cff66bbff|Hjournal:0:1031:14|h[Uldir]|h|r",
        "|cffa335ee|Hkeystone:180653:381:2:10:0:0:0|h[Keystone: Spires of Ascension (2)]|h|r",
        "|cffFF4E00|Hlevelup:2:LEVEL_UP_TYPE_CHARACTER|h[Level 2]|h|r",
        "|cff71d5ff|Hmawpower:358|h[Icy Heartcrust]|h|r",
        [[|cffff80ff|Houtfit:"a;"aA%ib"a>!.h&Ul"uH"a8"v""a@"v<"a"!!!!5o!!!!!!!!!|h[|T1598183:13:13:-1:0|tOutfit]|h|r]],
        "|Hplayer:Fadeshift|h[Fadeshift]|h",
        "|HplayerCommunity:Ketho-Anasterian:333281:1:1557794365297000:5886997898769|h[|cfffefefeKetho|r]|h",
        "|cffffff00|Hquest:53370:-1:110:120:3|h[Hour of Reckoning]|h|r",
        "|cff71d5ff|Hspell:2096:0|h[Mind Vision]|h|r",
        "|cffffd000|Hstorecategory:games|h[Click To Upgrade]|h|r",
        "|cff71d5ff|Htalent:21754|h[Circle of Healing]|h|r",
        "|cff4e96f7|Htalent:406:1|h[Improved Renew]|h|r",
        "|cffa330c9|Htalentbuild:577:70:BEkAAAAAAAAAAAAAAAAAAAAAAIBkQKRSaJJJSEIAAAAAAAaJJQLFSSKSi0QRSSSSSA|h[Talents: Havoc Demon Hunter]|h|r",
        "|cffffd000|Htrade:Player-3296-000957C8:195128:185|h[Cooking]|h|r",
        "|cffff80ff|Htransmogappearance:112825|h[Staff of the Penitent]|h|r",
        "|cffff80ff|Htransmogillusion:5862|h[Titanguard]|h|r",
        "|cffff80ff|Htransmogset:1414|h[Fierce Gladiator's Satin Armor (Gladiator)]|h|r",
        "|Hunit:Creature-0-2083-0-7-299-00005A0F91:Young Wolf|hYoung Wolf|h",
        "|HurlIndex:25|h|cff006995Frequently Asked Questions|r|h",
        "|cffffff00|Hworldmap:84:7222:2550|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a Map Pin Location]|h|r"
    }

    print("Testing parsing of links:")
    for _, link in ipairs(testLinks) do
        print(link)
    end
end
