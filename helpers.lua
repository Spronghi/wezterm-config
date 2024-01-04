local module = {}

function module.is_windows()
  return package.config:sub(1, 1) == "\\"
end

return module
