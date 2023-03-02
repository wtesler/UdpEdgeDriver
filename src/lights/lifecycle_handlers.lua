local capabilities = require "st.capabilities"

local lifecycle_handlers = {}

function lifecycle_handlers.device_added(driver, device)
    --device:emit_event(capabilities.switch.switch.on())
end

-- this is called both when a device is added (but after `added`) and after a hub reboots.
function lifecycle_handlers.device_init(driver, device)
    device:online()
end

function lifecycle_handlers.device_removed(driver, device)
    log.info("[" .. device.id .. "] Removing device")
end

return lifecycle_handlers
