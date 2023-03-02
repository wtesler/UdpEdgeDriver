local capabilities = require "st.capabilities"
local Driver = require "st.driver"

local discovery = require "lights.discovery"
local command_handlers = require "lights.command_handlers"
local lifecycle_handlers = require "lights.lifecycle_handlers"

local goveeLightDriver = Driver("Govee Lights", {
    discovery = discovery.handle_discovery,
    lifecycle_handlers = {
        added = lifecycle_handlers.device_added,
        init = lifecycle_handlers.device_init,
        removed = lifecycle_handlers.device_removed
    },
    capability_handlers = {
        [capabilities.momentary.ID] = {
            [capabilities.momentary.commands.push.NAME] = command_handlers.push
        }
    }
})

goveeLightDriver:run()
