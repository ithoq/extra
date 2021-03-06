--[[
	QQ:76888484
	http://yetsky.taobao.com/
]]--

local fs = require "nixio.fs"

m = Map("n2n", translate("N2N VPN"),
        translatef("n2n is a layer-two peer-to-peer virtual private network (VPN) which allows users to exploit features typical of P2P applications at network instead of application level."))

s = m:section(TypedSection, "edge", translate("N2N Edge Settings"))
s.anonymous = true

switch = s:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

mode = s:option(ListValue, "mode", translate("Interface mode"))
mode:value("0","V1")
mode:value("1","V2")

ipaddr = s:option(Value, "ipaddr", translate("Interface IP address"))
ipaddr.optional = false

supernode = s:option(Value, "supernode", translate("Supernode IP address"))
supernode.optional = false

port = s:option(Value, "port", translate("Supernode Port"))
port.datatype = "range(0,65535)"
port.optional = false

mtu = s:option(Value, "mtu", translate("Specify n2n MTU"))
mtu.datatype = "range(0,65535)"
mtu.optional = false

community = s:option(Value, "community", translate("N2N Community name"))
community.optional = false

s:option(Value, "key", translate("Encryption key"))

route = s:option(Flag, "route", translate("Enable packet forwarding"))
route.rmempty = false

s2 = m:section(TypedSection, "supernode", translate("N2N Supernode Settings"))
s2.anonymous = true

switch = s2:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

port = s2:option(Value, "port", translate("Port"))
port.datatype = "range(0,65535)"
port.optional = false

s3 = m:section(TypedSection, "supernode2", translate("N2N_V2 Supernode Settings"))
s3.anonymous = true

switch = s3:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

port = s3:option(Value, "port", translate("Port"))
port.datatype = "range(0,65535)"
port.optional = false

return m


