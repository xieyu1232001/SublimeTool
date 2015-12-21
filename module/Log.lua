
------------------------------------------------------------------
local LogFileList = {}

-- 初始化log文件
function CreateLogFile(keyname, path, filename)

	if not keyname or not filename then return end
	if LogFileList[keyname] then return end
	
	local logFile = {}
	logFile.keyname = keyname
	logFile.path = path
	logFile.filename = filename
	logFile.count = 0
	logFile.currFullName = path .. filename

	LogFileList[keyname] = logFile
	OpenLogFile(keyname)
	return true
end

-- 打开log文件
function OpenLogFile(keyname)

	local logFile = LogFileList[keyname]
	if not logFile then return end
	if logFile.file then logFile.file:close() end

	local errMsg
	logFile.file, errMsg = io.open(logFile.currFullName, "w+")
	if not logFile.file then print("Open log file fail", errMsg) end
	return logFile.file
end

-- 关闭
function CloseLogFile(keyname)

	local logFile = LogFileList[keyname]
	if not logFile then return end
	if logFile.file then logFile.file:close() end
end

-- 写文件
function WriteLog(keyname, msg)

	local logFile = LogFileList[keyname]
	if not logFile then return print("file is not init ", msg) end

	local result, errMsg, errNo
	result, errMsg, errNo = logFile.file:write(msg)
	if not result then 
		print("Write log error!", errMsg, errNo)
		return 
	end

	result, errMsg, errNo = logFile.file:flush()
	if not result then print("flush log error!", errMsg, errNo) end
end
