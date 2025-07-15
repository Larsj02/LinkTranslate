---@class AddonPrivate
local Private = select(2, ...)
local const = Private.constants

local defaultDatabase = {}

---@class LinkTranslateAddon : RasuAddonBase
local addon = LibStub("RasuAddon"):CreateAddon(
    const.ADDON_NAME,
    nil,
    defaultDatabase
)

Private.Addon = addon