local ALLOWED_IN_TRADE = { "^%s*wtb ", " wtb%s*$", " wtb ", "^%s*wts ", " wts%s*$", " wts ", "^%s*wtt ", " wtt%s*$", " wtt ", "^%s*lfw", " lfw%s*$", " lfw " }
local ALLOWED_IN_LFG = { "^%s*lf ", " lf%s*$", " lf ", "^%s*lfg ", " lfg%s*$", " lfg ", "^%s*lfm ", " lfm%s*$", " lfm ", "^%s*lf%d+m ", " lf%d+m%s*$", " lf%d+m " }

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(self, event, ...)
    local msg, _, _, _, _, _, zoneChannelID, _, channelBaseName, _ = ...
    
    -- Trade - City
    if zoneChannelID == 2 then
        for _, v in pairs(ALLOWED_IN_TRADE) do
            if string.find(msg:lower(), v) then
                return false
            end
        end
        return true
    -- LookingForGroup
    elseif channelBaseName == "LookingForGroup" then
        for _, v in pairs(ALLOWED_IN_LFG) do
            if string.find(msg:lower(), v) then
                return false
            end
        end
        return true
    end
    return false
end)
