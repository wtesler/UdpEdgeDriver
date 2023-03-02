local capabilities = require "st.capabilities"
local Driver = require "st.driver"

local command = require "lights.command"
local discovery = require "lights.discovery"
local lifecycle = require "lifecycle"

local discover = capabilities["peacevalley08112.discover"]

local driver = Driver("Govee Lights", {
    discovery = discovery.handle_discovery,

    lifecycle_handlers = {
        added = lifecycle.device_added,
        init = lifecycle.device_init,
        removed = lifecycle.device_removed
    },

    capability_handlers = {
        [discover.ID] = {
            [discover.commands.discover.NAME] = command.discover,
        }
    }
})

driver:run()
