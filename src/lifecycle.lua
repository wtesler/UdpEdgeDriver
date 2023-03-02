local log = require "log"

local command = {}

function command.device_added(driver, device)
    log.info("[" .. device.id .. "] Adding new device")
end

function command.device_init(driver, device)
    log.info("[" .. device.id .. "] Initializing new device")
    device:online()
end

function command.device_removed(driver, device)
    log.info("[" .. device.id .. "] Removing device")
end

return command
