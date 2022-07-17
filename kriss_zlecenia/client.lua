ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

CreateThread(function()
    exports.qtarget:AddBoxZone("xddd", vector3(1728.61, 3851.93, 34.74), 1, 1, {
        name="xddd",
        heading=300.0,
        debugPoly=false,
        minZ=32.77834,
        maxZ=36.87834,
        }, {
            options = {
                {
                    event = "kriss:zleceniealetoclient",
                    icon = "fas fa-users",
                    label = "Zapukaj do drzwi",
                },
            },
            distance = 3.0
    })
end)

CreateThread(function()
    exports.qtarget:AddBoxZone("way1", vector3(1395.44, 3623.18, 34.89), 2, 2, {
        name="way1",
        heading=300.0,
        debugPoly=false,
        minZ=32.77834,
        maxZ=36.87834,
        }, {
            options = {
                {
                    event = "kriss:oddajjeden1",
                    icon = "fas fa-users",
                    label = "Oddaj towar",
                },
            },
            distance = 3.0
    })
end)

CreateThread(function()
    exports.qtarget:AddBoxZone("way3", vector3(3591.3, 3659.37, 33.87), 2, 2, {
        name="way3",
        heading=0.0,
        debugPoly=false,
        minZ=32.77834,
        maxZ=36.87834,
        }, {
            options = {
                {
                    event = "kriss:oddajtrzy",
                    icon = "fas fa-users",
                    label = "Oddaj towar",
                },
            },
            distance = 3.0
    })
end)

CreateThread(function()
    exports.qtarget:AddBoxZone("way2", vector3(-231.12, 6234.37, 31.5), 2, 2, {
        name="way2",
        heading=0.0,
        debugPoly=false,
        minZ=32.77834,
        maxZ=36.87834,
        }, {
            options = {
                {
                    event = "kriss:oddajdwa1",
                    icon = "fas fa-users",
                    label = "Oddaj towar",
                },
            },
            distance = 3.0
    })
end)


RegisterNetEvent('kriss:zleceniealetoclient', function()
    ESX.ShowAdvancedNotification('ROB', 'ROZMOWA', '~g~Co potrzebujesz?', 'CHAR_ARTHUR', 2) -- notyfiakcja
    SetNotificationBackgroundColor(11) -- color notki
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "kriss_zlecenia", {
        title = "Rozmowa", -- tytul esx_menu_default
        align = "right",  -- polozenie
        elements = { 
            {label = "Potrzebuje Zlecenia", value = "tak"}, -- element 1 
            {label = "Nic przepraszam pomylka", value = "nie"},  -- element 1
        }
    }, function(data, menu) 
 
-- TAK
        if data.current.value == "tak" then -- element 1 
            ESX.ShowAdvancedNotification('ROB', 'ROZMOWA', '~g~Dobra zaczekaj chwile wszystko zaraz ci podesle a i wez ten pojazd!', 'CHAR_ARTHUR', 1) -- notyfiakcja
            ESX.Game.SpawnVehicle('rumpo', vector3(1736.93, 3841.58, 33.81), 100.0, function(vehicle)
            end)

-- NIE
            menu.close() 
        Wait(20000)
        ESX.ShowAdvancedNotification('ROB', 'ROZMOWA', '~g~Dobra dostalem cyne gdzie zawiesc towar wszystko masz oznaczone na gps!', 'CHAR_ARTHUR', 1) -- notyfiakcja
        TriggerServerEvent('kriss:zlecenieserver')
        
        elseif data.current.value == "nie" then -- element 2
            ESX.ShowAdvancedNotification('ROB', 'ROZMOWA', '~g~Nie zawracaj mi wiecej glowy!!', 'CHAR_ARTHUR', 1) -- notyfiakcja
            menu.close() 
        end
    end, function(data, menu)
        menu.close() 
    end)
    end)

RegisterNetEvent('kriss:waypoint1', function()
    SetNewWaypoint(1395.21, 3623.64) -- miejsce 1 
end)

RegisterNetEvent('kriss:waypoint2', function()
    SetNewWaypoint(-231.25, 6235.03) -- miejsce 2
end)

RegisterNetEvent('kriss:waypoint3', function()
    SetNewWaypoint(3561.26, 3659.06) -- miejsce 3
end)

RegisterNetEvent('kriss:oddajjeden1', function()
    TriggerServerEvent('kriss:oddajjeden')
end)

RegisterNetEvent('kriss:oddajdwa1', function()
    TriggerServerEvent('kriss:oddajdwa')
end)

RegisterNetEvent('kriss:oddajtrzy', function()
    TriggerServerEvent('kriss:oddajtrzy1')
end)



