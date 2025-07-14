local GetLib = _G["GetLib"]

if not GetLib then
    ---@class GetLib
    GetLib = {
        libraries = {},
        registry = {},
    }
    _G["GetLib"] = GetLib
end

---@class SemVer
---@field major number
---@field minor number
---@field patch number

---@param version string
---@return SemVer
local function parseVersion(version)
    if not version or version == "" or version == "*" then
        return { major = -1, minor = -1, patch = -1 }
    end

    local major, minor, patch = version:match("(%d+)%.?(%d*)%.?(%d*)")
    major = tonumber(major) or 0
    minor = tonumber(minor) or (version:match("%.%*") and -1 or 0)
    patch = tonumber(patch) or
    (version:match("%.%*", version:find("%.") and version:find("%.", version:find("%.") + 1) or nil) and -1 or 0)

    return { major = major, minor = minor, patch = patch }
end

---@param versionA string
---@param versionB string
---@return integer -1 (a>b), 0 (a=b), or 1 (a<b)
local function compareVersions(versionA, versionB)
    local a = parseVersion(versionA)
    local b = parseVersion(versionB)

    if a.major > b.major then return 1 end
    if a.major < b.major then return -1 end

    if a.minor > b.minor then return 1 end
    if a.minor < b.minor then return -1 end

    if a.patch > b.patch then return 1 end
    if a.patch < b.patch then return -1 end

    return 0
end

---@param version string
---@param pattern string
---@return boolean
local function versionMatchesPattern(version, pattern)
    if not pattern or pattern == "" or pattern == "*" then
        return true
    end

    local v = parseVersion(version)
    local p = parseVersion(pattern)

    if p.major >= 0 and v.major ~= p.major then
        return false
    end

    if p.minor >= 0 and v.minor ~= p.minor then
        return false
    end

    if p.patch >= 0 and v.patch ~= p.patch then
        return false
    end

    return true
end

---@param name string
---@param pattern string
---@return string? bestVersion
local function findBestVersionMatch(name, pattern)
    if not GetLib.libraries[name] then
        return
    end
    local bestVersion

    for version in pairs(GetLib.libraries[name]) do
        if versionMatchesPattern(version, pattern) then
            if not bestVersion or compareVersions(version, bestVersion) > 0 then
                bestVersion = version
            end
        end
    end

    return bestVersion
end

---@param name string
---@param version string
---@param library ?table
---@return table? library
function GetLib:RegisterLibrary(name, version, library)
    assert(type(name) == "string", "Library name must be a string")
    assert(type(version) == "string", "Version must be a string in format 'Major.Minor.Patch'")
    library = library or {}

    local parsedVersion = parseVersion(version)
    assert(parsedVersion.major >= 0, "Invalid version format. Expected 'Major.Minor.Patch'")

    self.libraries[name] = self.libraries[name] or {}

    if self.libraries[name][version] then
        return
    end
    self.libraries[name][version] = library

    local currentLatest = self.registry[name] and self.registry[name].version
    if not currentLatest or compareVersions(version, currentLatest) > 0 then
        self.registry[name] = {
            version = version,
            library = library
        }
    end

    return library
end

---@param name string
---@param versionPattern ?string
---@param silent ?boolean
---@return table? library, string? version
function GetLib:GetLibrary(name, versionPattern, silent)
    assert(type(name) == "string", "Library name must be a string")
    versionPattern = versionPattern or "*"

    local bestVersion = findBestVersionMatch(name, versionPattern)

    if bestVersion then
        return self.libraries[name][bestVersion], bestVersion
    end

    if not silent then
        error(("Cannot find library '%s' matching version pattern '%s'"):format(name, versionPattern), 2)
    end
    return nil
end

---@generic T: table, K, V
---@return fun(table: table<K, V>, index?: K):K, V
---@return T
function GetLib:IterateLibraries()
    return pairs(self.libraries)
end

setmetatable(GetLib, { __call = GetLib.GetLibrary })


local function convertLibstub()
    if _G["LibStub"] then
        if LibStub.converted then return end
        for name, library in LibStub:IterateLibraries() do
            GetLib:RegisterLibrary(name, ("%d.0.0"):format(LibStub.minors[name]), library)
        end
    end

    local libstubReplaced = { minor = 9, converted = true }
    _G["LibStub"] = libstubReplaced

    ---@param name any
    ---@param major any
    function libstubReplaced:NewLibrary(name, major)
        return GetLib:RegisterLibrary(name, ("%d.0.0"):format(major))
    end

    ---@param name string
    ---@param silent ?boolean
    ---@return table? library
    ---@return number? version
    function libstubReplaced:GetLibrary(name, silent)
        local library, version = GetLib:GetLibrary(name, "*", silent)
        if not (library and version) then return end
        local major = version:match("^(%d+)%.")
        if tonumber(major) then
            return library, tonumber(major)
        end
    end

    ---@generic T: table, K, V
    ---@return fun(table: table<K, V>, index?: K):K, V
    ---@return T
    function libstubReplaced:IterateLibraries()
        return GetLib:IterateLibraries()
    end

    setmetatable(libstubReplaced, { __call = libstubReplaced.GetLibrary })
end

convertLibstub()
