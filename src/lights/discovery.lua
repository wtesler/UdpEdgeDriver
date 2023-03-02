local discovery = {}

function discovery.handle_discovery(driver, _should_continue)
    local metadata = {
        type = "LAN",
        device_network_id = "Govee Lights",
        label = "Govee Lights",
        profile = "lights.v1",
        manufacturer = "Govee",
        model = "v1",
        vendor_provided_label = nil
    }

    driver:try_create_device(metadata)
end

return discovery
