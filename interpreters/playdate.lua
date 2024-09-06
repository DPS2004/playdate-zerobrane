local function updir(fname) --whats updir?
	local fname2 = ""
	local offset = 0
	if string.sub(fname,-1) == "/" then
		fname = string.sub(fname,1,-2)
	end
	fname2 = fname:match(".*[\\/](.*)")
	if fname2 then
		fname = string.sub(fname,1,-(string.len(fname2)+2))
		return fname, fname2
	else
		return ""
	end
end

--NOTIHN MUCH, HOW ABOUT YOU!

return {
	name = 'Playdate',
	description = 'Playdate Lua API',
	api = {'baselib','playdate'},
	frun = function(self,wfilename,rundebug)
		
		local sdkPath = os.getenv('PLAYDATE_SDK_PATH')
		local projDir,sourceFolder = updir(self:fworkdir(wfilename))
		local _,projName = updir(projDir)
		
		projName = projName .. '.pdx'
		
		if not sdkPath then
			ide:Print('PLAYDATE_SDK_PATH environment variable not set.')
			return
		end
		
		local pdc = MergeFullPath(sdkPath,'bin/pdc')
		local sim = MergeFullPath(sdkPath,'bin/PlaydateSimulator')
		local pdutil = MergeFullPath(sdkPath,'bin/pdutil')
		
		return CommandLineRun(pdc .. ' -v "' .. sourceFolder .. '" "' .. projName,projDir,true,true,nil,nil,function()
			if rundebug then
				CommandLineRun(pdutil .. ' install ' .. projName,projDir,true,true,nil,nil,function() 
					CommandLineRun(pdutil .. ' run Games/' .. projName,projDir,true,true,nil,nil,function() end)
				end)
			else
				CommandLineRun(sim .. ' ' .. projName,projDir,true,true,nil,nil,function() end)
			end
		end)
		
	end,
	hasdebugger = true,
	scratchextloop = true,
	takeparameters = true,
}