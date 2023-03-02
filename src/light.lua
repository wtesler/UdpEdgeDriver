local capabilities = require "st.capabilities"
local Driver = require "st.driver"

local command = require "command"
local discovery = require "discovery"
local lifecycle = require "lifecycle"

local hello_world_driver = Driver("GoveeLightDriver", {
    discovery = discovery.handle_discovery,

    lifecycle_handlers = {
        added = lifecycle.device_added,
        init = lifecycle.device_init,
        removed = lifecycle.device_removed
    },

    capability_handlers = {
        [capabilities.switch.ID] = {
            [capabilities.switch.commands.on.NAME] = command.switch_on,
            [capabilities.switch.commands.off.NAME] = command.switch_off,
        },
    }
})

hello_world_driver:run()
