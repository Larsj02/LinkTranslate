---@class AddonPrivate
local Private = select(2, ...)

---@class GUIDUtils
local guidUtils = {
    generated = {}
}
Private.GUIDUtils = guidUtils

---@return string
function guidUtils:GenerateGUID()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    local guid
    repeat
        guid = string.gsub(template, "[xy]", function(c)
            local v = (c == "x") and math.random(0, 15) or math.random(8, 11)
            return string.format("%x", v)
        end)
    until not self.generated[guid]
    self.generated[guid] = true
    return guid
end