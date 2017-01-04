package.path = package.path .. ";?.lua"
local L = (require("FunctionalX")).lists
local legal_flags = {
  "-a",
  "-t"
}
local usage = [[-------------------------------
 |  | ||| Automagical ||| |  |
-------------------------------
Usage: auto module1
       auto module1 -a arg1
       auto -t module1
       auto -t module1 -a arg1
       auto -t module1 -a arg1 -t module2 -a arg2 ...
]]
local is_flag
is_flag = function(str)
  if str == nil then
    return false
  end
  for _index_0 = 1, #legal_flags do
    local x = legal_flags[_index_0]
    if str == x then
      return true
    end
  end
  return false
end
local rm_ext
rm_ext = function(str)
  return string.match(str, "^[.]?[\\/]?[^.]+")
end
local parse
parse = function(terminal_args)
  local aux
  aux = function(terminal_args, targets, target_args, flag)
    if flag == nil then
      flag = "-t"
    end
    if #terminal_args == 0 then
      return targets, target_args
    end
    if is_flag((L.head(terminal_args))) then
      local new_flag = L.head(terminal_args)
      return aux((L.tail(terminal_args)), targets, target_args, new_flag)
    else
      local _exp_0 = flag
      if "-t" == _exp_0 then
        return aux((L.tail(terminal_args)), (L.append(targets, rm_ext(L.head(terminal_args)))), target_args, "-t")
      elseif "-a" == _exp_0 then
        return aux((L.tail(terminal_args)), targets, (L.append(target_args, (L.head(terminal_args)))), "-t")
      else
        return aux({ }, targets, target_args)
      end
    end
  end
  return aux(terminal_args, { }, { })
end
local work
work = function(targets, args)
  if #targets == 0 then
    return "DONE!"
  else
    local M = require((L.head(targets)))
    M.main((L.head(args)))
    return work((L.tail(targets)), (L.tail(args)))
  end
end
local main
main = function(terminal_args)
  if #terminal_args == 0 then
    return usage
  end
  local target_modules, target_args = parse(terminal_args)
  if #target_modules == 0 then
    return usage
  end
  return work(target_modules, target_args)
end
return print(main(arg))
