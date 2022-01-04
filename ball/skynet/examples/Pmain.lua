local skynet = require "skynet"
local socket = require "skynet.socket"

skynet.start(function()

    skynet.newservice("debug_console", 8000)

    skynet.error("[Pmain] start")
    local ping1 = skynet.newservice("ping")
    local ping2 = skynet.newservice("ping")
    local ping3 = skynet.newservice("ping")

    skynet.send(ping1, "lua", "start", ping3)
    skynet.send(ping2, "lua", "start", ping3)
    skynet.exit()
end)

-- local clients = {}

-- skynet.start(function()
--     local listendfd = socket.listen("0.0.0.0", 8888)
--     socket.start(listendfd, connect)
-- end)

-- function connect(fd, addr)
--     print(fd .. " connected addr: " .. addr)
--     socket.start(fd)
--     clients[fd] = {}
--     while true do
--         local readdata = socket.read(fd)
--         if readdata ~= nil then
--             print(fd .. " recv " .. readdata)

--             for i, _ in pairs(clients) do
--                 if i ~= fd then
--                     socket.write(i, readdata)
--                 end
--             end
--         else
--             print(fd .. " close ")
--             socket.close(fd)
--             clients[fd] = nil
--         end
--     end
-- end