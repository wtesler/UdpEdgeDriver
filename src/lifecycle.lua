local log = require "log"

local lifecycle = {}

function lifecycle.device_added(driver, device)
    log.info("[" .. device.id .. "] Adding new device")
end

function lifecycle.device_init(driver, device)
    log.info("[" .. device.id .. "] Initializing new device")
    device:online()
end

function lifecycle.device_removed(driver, device)
    log.info("[" .. device.id .. "] Removing device")
end

return lifecycle
