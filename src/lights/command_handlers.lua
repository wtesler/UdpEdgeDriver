local capabilities = require "st.capabilities"

local command_handlers = {}

function command_handlers.switch_on(driver, device, command)
    device:emit_event(capabilities.switch.switch.on())
end

function command_handlers.switch_off(driver, device, command)
    device:emit_event(capabilities.switch.switch.off())
end

function command_handlers.refresh(driver, device, command)

end

function command_handlers.configure(driver, device, command)

end

function command_handlers.push(driver, device, command)

end

return command_handlers
