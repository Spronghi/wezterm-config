local module = {}

function module.getos()
  -- ask LuaJIT first
  if jit then
    return jit.os
  end

  -- Unix, Linux variants
  local fh, err = assert(io.popen(e "uname -o 2>/dev/null", "r"))
  if fh then
    osname = fh:read()
  end

  return osname or "Windows"
end

function module.iswindows()
  return module.getos() == "Windows"
end

function module.ismac()
  return module.getos() == "OSX"
end

return module
