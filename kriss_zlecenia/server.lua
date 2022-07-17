ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kriss:zlecenieserver')
AddEventHandler('kriss:zlecenieserver', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  math.randomseed(os.time())
  local szescie = math.random(1, 3)
  xxx = math.random(1, 3)
  
    if szescie <= 1 then
    xPlayer.addInventoryItem("paczkamety", xxx)
    xPlayer.triggerEvent('kriss:waypoint1')
    else
    if szescie <= 2 then
    xPlayer.addInventoryItem("paczkadobr", xxx)
    xPlayer.triggerEvent('kriss:waypoint2')
    else
    if szescie <= 3 then
    xPlayer.addInventoryItem("paczkachemi", xxx)
    xPlayer.triggerEvent('kriss:waypoint3') 
    end
    end
  end
end)


RegisterServerEvent('kriss:oddajjeden')
AddEventHandler('kriss:oddajjeden', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xxx = math.random(1, 3)
  if xPlayer.getInventoryItem('paczkamety').count >= 1 then
  xPlayer.removeInventoryItem("paczkamety", xxx)
  sianko = math.random (2200, 6440)
  xPlayer.addMoney(sianko)
  xPlayer.showNotification("Dostales ".. sianko .. " za ".. xxx .." !")
 end
end)

RegisterServerEvent('kriss:oddajdwa')
AddEventHandler('kriss:oddajdwa', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xxx2 = math.random(1, 3)
  if xPlayer.getInventoryItem('paczkadobr').count >= 1 then
  xPlayer.removeInventoryItem("paczkadobr", xxx2)
  sianko2 = math.random (2200, 6440)
  xPlayer.addMoney(sianko2)
  xPlayer.showNotification("Dostales ".. sianko2 .. " za ".. xxx2 .." !")
 end
end)

RegisterServerEvent('kriss:oddajtrzy1')
AddEventHandler('kriss:oddajtrzy1', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xxx2 = math.random(1, 3)
  if xPlayer.getInventoryItem('paczkachemi').count >= 1 then
   xPlayer.removeInventoryItem("paczkachemi", xxx2)
  sianko2 = math.random (14000, 16440)
  xPlayer.addMoney(sianko2)
  xPlayer.showNotification("Dostales ".. sianko2 .. " za ".. xxx2 .." !")
 end
end)