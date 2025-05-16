local serial = require("serial")

test_case("List serial devices", function()
	print()
	print()
	local devices, err = serial.list_devices()
	if err then
		print(err)
		return
	end
	assert(devices ~= nil)
	for i, device in ipairs(devices) do
		print(i)
		print(device.path)
		print(device.type)
		print(device.description)
	end
	print()
end)

test_case("Get port info", function()
	print()
	print()
	local info, err = serial.get_port_info("/dev/cu.usbmodem149202")
	assert(not err)
	assert(info)
	print(info.type)
	print()
end)

test_case("Reading from serial device", function()
	print()
	print()
	local port, err = serial.open("/dev/cu.usbmodem149202")
	assert(not err)
	assert(port)
	local result, err2 = serial.read_until(port, "src.-CH8")
	assert(not err2)
	assert(result)
	print(result)

	print()
end)
