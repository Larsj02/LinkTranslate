---@class AddonPrivate
local Private = select(2, ...)

local const = Private.constants
local addon = Private.Addon

function addon:OnInitialize(...)
    -- On Init
end

function addon:OnEnable(...)
    local chatUtils = Private.ChatUtils
    chatUtils:ReplaceChatFunctions()

    self:RegisterCommand({ "testlinks", "tl" }, function()
        chatUtils:SendTestLinks()
    end)
end
