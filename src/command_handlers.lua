local log = require "log"
local capabilities = require "st.capabilities"

function createOnOffMessage(isOn)
    local onOffStr = isOn and '1' or '0'
    return string.format('{"msg": {"cmd": "turn","data": { "value": %s }}}', onOffStr)
end

function sendUDP(msg)
    local socket = require "socket"
    local udp = assert(socket.udp())
    assert(udp:sendto(msg, "10.0.0.98", 4001))
    assert(udp:sendto(msg, "10.0.0.107", 4001))
    assert(udp:close())
end

local command_handlers = {}

-- callback to handle an `on` capability command
function command_handlers.switch_on(driver, device, command)
    sendUDP(createOnOffMessage(true))
    log.debug(string.format("[%s] calling set_power(on)", device.device_network_id))
    device:emit_event(capabilities.switch.switch.on())
end

-- callback to handle an `off` capability command
function command_handlers.switch_off(driver, device, command)
    sendUDP(createOnOffMessage(false))
    log.debug(string.format("[%s] calling set_power(off)", device.device_network_id))
    device:emit_event(capabilities.switch.switch.off())
end

return command_handlers
