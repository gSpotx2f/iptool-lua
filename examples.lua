
local it = require("iptool")


-- validate_ip()
-- return: bool
print(it.validate_ip("192.168.51.20"))      -- true
print(it.validate_ip("192.168.10.0/24"))    -- true
print(it.validate_ip("192.168.380.0/24"))   -- false
print(it.validate_ip("192.168.10.0/36"))    -- false
print(it.validate_ip("wrongip"))            -- false


-- ip_to_int()
-- return: string
print(it.validate_ip("192.168.51.20") and it.ip_to_int("192.168.51.20"))    -- 3232248596


-- int_to_ip()
-- return: integer
print(it.int_to_ip(3232248596))             -- 192.168.51.20


-- summarize_address_range()
-- return: iterator
for k in it.summarize_address_range("192.168.0.10", "192.168.0.100") do
    print(it.int_to_ip(k[1]), k[2])         -- k[1] - ipaddr (int), k[2] - CIDR prefix
end

for k in it.summarize_address_range(3232235530, "192.168.0.100") do
    print(it.int_to_ip(k[1]), k[2])
end


-- get_network_addr()
-- return: integer, integer
local addr, prefix = it.get_network_addr("192.168.1.0/24")
print(addr, prefix)


-- hosts_from_network()
-- return: iterator
for i in it.hosts_from_network("192.168.100.30/27") do
    print(i, it.int_to_ip(i))
end


-- get_supernet()
-- return: integer
print(it.get_supernet("192.168.5.16/28", 16))                           -- 3232235520
print(it.get_supernet({[1] = 3232236816, [2] = 28}, 16))                -- arg: {[1] = <ipaddr (int)>, [2] = <prefix>}
print(it.int_to_ip(it.get_supernet({[1] = 3232236816, [2] = 28}, 16)))  -- 192.168.0.0
