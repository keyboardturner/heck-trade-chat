local function heck()
	LeaveChannelByName("Trade")
end
local darn = CreateFrame("Frame")
darn:RegisterEvent("CHANNEL_UI_UPDATE")
darn:SetScript("OnEvent", heck)
--[[local thingsToHide = {
	"^%[Common]",
	"^%[Darnassian]",
	"^%[Dwarven]",
	"^%[Gnomish]",
	"^%[Draenei]",
	"^%[Orcish]",
	"^%[Zandali]",
	"^%[Taurahe]",
	"^%[Gutterspeak]",
	"^%[Thalassian]",
	"^%[Goblin]",
	"^%[Shalassian]",
	"^%[Vulpera]",
};


local LANGUAGE_REPLACEMENTS = {
	["Orcish"] = {
		[1] = {"a", "n", "g", "o", "l"},
		[2] = {"ha", "ko", "no", "mu", "ag", "ka", "gi", "il"},
		[3] = {"lok", "tar", "kaz", "ruk", "kek", "mog", "zug", "gul", "nuk", "aaz", "kil", "ogg"},
		[4] = {"rega", "nogu", "tago", "uruk", "kagg", "zaga", "grom", "ogar", "gesh", "thok", "dogg", "maka", "maza"},
		[5] = {"regas", "nogah", "kazum", "magan", "no'bu", "golar", "throm", "zugas", "re'ka", "no'ku", "ro'th"},
		[6] = {"thrakk", "revash", "makazz", "moguna", "no'gor", "goth'a", "raznos", "ogerin", "gezzno", "thukad", "makogg", "aaz'no"},
		[7] = {"lok'Tar", "gul'rok", "kazreth", "tov'osh", "zil'Nok", "rath'is", "kil'azi"},
		[8] = {"throm'ka", "osh'Kava", "gul'nath", "kog'zela", "ragath'a", "zuggossh", "moth'aga"},
		[9] = {"tov'nokaz", "osh'kazil", "no'throma", "gesh'nuka", "lok'mogul", "lok'bolar", "ruk'ka'ha"},
		[10] = {"regasnogah", "kazum'nobu", "throm'bola", "gesh'zugas", "maza'rotha", "ogerin'naz"},
		[11] = {"thrakk'reva", "kaz'goth'no", "no'gor'goth", "kil'azi'aga", "zug-zug'ama", "maza'thrakk"},
		[12] = {"lokando'nash", "ul'gammathar", "golgonnashar", "dalggo'mazah"},
		[13] = {"khaz'rogg'ahn", "moth'kazoroth"},
	},
	["Darnassian"] = {
		[1] = {"z"}
	},
};]]

--[[local languagelist = {
	["^%[Common]"] = "[Common]",
	["^%[Darnassian]"] = "[Darnassian]",
	["^%[Dwarven]"] = "[Dwarven]",
	["^%[Gnomish]"] = "[Gnomish]",
	["^%[Draenei]"] = "[Draenei]",
	["^%[Orcish]"] = "[Orcish]",
	["^%[Zandali]"] = "[Zandali]",
	["^%[Taurahe]"] = "[Taurahe]",
	["^%[Gutterspeak]"] = "[Gutterspeak]",
	["^%[Thalassian]"] = "[Thalassian]",
	["^%[Goblin]"] = "[Goblin]",
	["^%[Shalassian]"] = "[Shalassian]",
	["^%[Vulpera]"] = "[Vulpera]",
	["^%[Darnassian]"] = "[Darnassian]",
	["^%[Zandali]"] = "[Zandali]",

};]]
--[[
local function ReplaceLanguage(text, language)
	local replacements = LANGUAGE_REPLACEMENTS[language];
	assert(replacements, "unsupported language")

	return string.gsub(text, "[^%s]+", function(word)
		local hash = 5381;
		for i = 1, #word do
			hash = bit.bxor((hash * 33), string.byte(word, i, i));
		end

		local choices = replacements[#word];
		if not choices then
			-- Long words should just use the longest word-length set.
			choices = replacements[#replacements];
		end

		return choices[(hash % #choices) + 1];
	end);
end



ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", function(frame, event, message, sender, ...)
    for i, v in ipairs(thingsToHide) do
        if message:find(v) then
            local translatedMessage = ReplaceLanguage(message, "Orcish")
            return false, "|cff1ce651" .. "placeholder" .. "|r " .. translatedMessage, sender, ...
            --return false, "|cff1ce651[Darnassian]|r " .. cowboytown[string.len(message)-13], sender, ... --I want to archive this for later.
        end
    end
end)
]]
--[[ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", function(frame, event, message, sender, ...)
	for i, v in ipairs(thingsToHide) do
		if message:find(v) then
			return false, "|cff1ce651" .. languagelist[v] .. "|r " .. "*Unintelligible*", sender, ...
			--return false, "|cff1ce651[Darnassian]|r " .. cowboytown[string.len(message)-13], sender, ... --I want to archive this for later.
		end
	end
end)]]


--[[cowboytown = {
	[0] = "",
	[1] =  "A", "D", "E", "I", "N", "O",
	[2] = "Al", "An", "Da", "Do", "Lo", "Ni", "No", "Ri", "Su",
	[3] = "Ala", "Ano", "Anu", "Ash", "Dor", "Dur", "Fal", "Nei", "Nor", "Osa", "Tal", "Tur",
	[4] = "Alah", "Aman", "Anar", "Andu", "Dath", "Dieb", "Diel", "Fulo", "Mush", "Rini", "Shar", "Thus",
	[5] = "Adore", "Balah", "Bandu", "Eburi", "Fandu", "Ishnu", "Shano", "Shari", "Talah", "Terro", "Thera", "Turus",
	[6] = "Asto're", "Belore", "Do'rah", "Dorini", "Ethala", "Falla", "Ishura", "Man'ar", "Neph'o", "Shando", "T'as'e", "U'phol",
	[7] = "seven letter",
	[8] = "eight letter",
	[9] = "nine letter",
	[10] = "ten letter",
	[11] = "",
	[12] = "",
	[13] = "",
};]]