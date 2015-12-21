print("main star")
require("module.Log")

local PROGRAM_LOG_PATH = "C:\\Users\\xiehuanbiao\\AppData\\Roaming\\Sublime Text 3\\Packages\\User\\"
local SNIPPET_TEXT = "<snippet>\n\t<content><![CDATA[%s]]></content>\n\t<tabTrigger>%s</tabTrigger>\n\t<scope>source.%s</scope>\n</snippet>"

-- 配置关键词
local sublimekey = {}
table.insert(sublimekey, {key = "ld",	content = "LogDebug",	scope = "lua"})
table.insert(sublimekey, {key = "li",	content = "LogInfo",	scope = "lua"})
table.insert(sublimekey, {key = "lw",	content = "LogWarning",	scope = "lua"})
table.insert(sublimekey, {key = "le",	content = "LogError",	scope = "lua"})
table.insert(sublimekey, {key = "con",	content = "console.log()",	scope = "js"})

for k,v in pairs(sublimekey) do
	local config = sublimekey[k]
	CreateLogFile(config.content, PROGRAM_LOG_PATH ,config.content..".sublime-snippet" , 0)

	local msg1 = string.format(SNIPPET_TEXT, config.content, config.key, config.scope)
	WriteLog(config.content, msg1)
	CloseLogFile(config.content)
end
