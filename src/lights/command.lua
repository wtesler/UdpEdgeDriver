local log = require "log"

local command_handler = {}

function command_handler.discover(driver, device, command)
    log.info("Discovering")
end

return command_handler
