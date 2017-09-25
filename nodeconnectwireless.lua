-- Relay.lua
-- For use with NodeMCU or GAgent MCU Model within 8 Channel Relay Module
local SSID = "cts retail"      -- Enter your SSID
local pwd  = "changi123!"      -- Enter your password

wifi.setmode(wifi.STATIONAP)
wifi.sta.config(SSID,pwd)
wifi.sta.autoconnect(1)
tmr.alarm(1, 1000, tmr.ALARM_AUTO, function()
    blinking({100,100,100})
if wifi.sta.getip() == nil then
        print('Waiting for IP ...')
    else
        print('IP is ' .. wifi.sta.getip())
    tmr.stop(1)
    end

local pin = 1
gpio.mode(pin, gpio.OUTPUT)

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = "<!DOCTYPE html>"
                .."<HTML><HEAD><TITLE>NodeMCU ESP8266 Relay Control</TITLE></HEAD><BODY><CENTER>"
                .."<h1>WeMos Relay Control</h1>"
                .."<p><h2>Switch &nbsp<a href=\"?pin=ON1\"><button style='height:40px;width:100px;background-color:green;color:white'>ON</button>"
                .."</a>&nbsp;<a href=\"?pin=OFF1\"><button style='height:40px;width:100px;background-color:red; color:white'>OFF</button></a></h2></p>"
                .."<BR><p>HUANG SHUHAO 11-AUG-2017-SG</p>"
                .."</CENTER></BODY></HTML>"
        local _on,_off = "",""
        if(_GET.pin == "ON1")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF1")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON2")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF2")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON3")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF3")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON4")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF4")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON5")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF5")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON6")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF6")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON7")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF7")then
            gpio.write(pin, gpio.LOW);
        end
         local _on,_off = "",""
        if(_GET.pin == "ON8")then
            gpio.write(pin, gpio.HIGH);
        elseif(_GET.pin == "OFF8")then
            gpio.write(pin, gpio.LOW);
        end                
        client:send(buf)
        client:close()
    end)
end)
