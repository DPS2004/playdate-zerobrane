inspect = require('inspect.inspect')
api = {}

lines = {}

function trim(s)
   return s:match "^%s*(.-)%s*$"
end

function startsWith(str,k)
	if (string.sub(trim(str),0,#k) == k) then
		return string.sub(trim(str),#k+1)
	else
		return nil
	end
end

function removeBetween(str,k)
	local _,_, a,b = string.find(str, '^%s*(%S+)%s*'..k..'%s*(.+)%s*$')
	return a,b
end

for line in io.lines("playdate-types/__types.lua") do table.insert(lines, line) end


local start = 0
local limit = 99999

currentClass = ''
currentComment = ''
for n,l in ipairs(lines) do
	if n < start then
		goto continue
	end
	if startsWith(l,'---@type') then
		goto continue
	end
	
	if startsWith(l,'---@alias') then
		goto continue
	end
	
	if startsWith(l,'---@class') then
		local class = startsWith(l,'---@class')
		if class:find(':') then
			local a,b = removeBetween(class,':')
			api[a] = {
				type = 'class'
			}
			currentClass = a
		else
			class = trim(class)
			api[class] = {
				type = 'class'
			}
			currentClass = class
		end
		goto continue
	end
	
	if startsWith(l,'---@field') then
		local field = trim(startsWith(l,'---@field'))
		
		api[currentClass].childs = api[currentClass].childs or {}
		
		local n,ret = removeBetween(field,'')
		
		local params = nil
		local t = 'value'
		if ret:find('fun%(') then
			local _,_, p,r = string.find(ret,'^%s*(.+)%s*%):%s*(.+)%s*$')
			p = p or ret
			starts = startsWith(p,'fun(')
			if starts then
				params = '('..starts ..')'
			else
				params = p
			end
			ret = r or ret
			if ret:find('%?') then
				ret = ret:sub(1,#ret-1) .. ' | nil'
			end
			
			t = 'function'
		end
		local child = {
			type = t,
			
			args = params,
			returns = '('..ret..')'
		}
		
		if currentComment ~= '' then
			child.description = currentComment
			currentComment = ''
		end
		
		api[currentClass].childs[n] = child
		goto continue
	end
	if startsWith(l,'--- ') then
		if currentComment == '' then
			currentComment = startsWith(l,'--- ')
		else
			currentComment = currentComment ..'\n'.. startsWith(l,'--- ')
		end
	end
	
	if n >= limit then
		break
	end
	::continue::
end

print(inspect(api))