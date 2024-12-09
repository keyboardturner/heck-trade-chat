local function heck()
	for i = 1, GetNumDisplayChannels() do
		local channel = C_ChatInfo.GetChannelInfoFromIdentifier(i);
		if channel and channel.shortcut and channel.zoneChannelID then
			if channel.zoneChannelID == 2 or channel.zoneChannelID == 42 then -- Trade / Services
				LeaveChannelByName(channel.shortcut)
			end
		end
	end
end
local darn = CreateFrame("Frame")
darn:RegisterEvent("CHANNEL_UI_UPDATE")
darn:SetScript("OnEvent", heck)