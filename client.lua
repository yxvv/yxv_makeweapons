ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



make_jakies_gowna = function(action)
	local elements = {
		{label = 'Rękojeść', value = 'knife_handle'},
		{label = 'Ostrze', value = 'knife_blade'},
		{label = 'Obicie', value = 'weapon_tape'},
		{label = 'Sprężyna', value = 'knife_spring'},
		{label = 'Nieowinięty kastet', value = 'knuckle_base'},
		{label = 'Nieowinięty kij', value = 'bat_base'},
	}
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'crafting',
	{
		title = 'Tworzenie przedmiotów',
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		local action = data.current.value
		if craft == false then
			craft = true
			TriggerServerEvent('yx_make:craftgowno', action)
                   else
                       ESX.ShowNotification('Jestes w trakcie')
		end
	ESX.UI.Menu.CloseAll()
	end, function(data, menu)
		menu.close()
	end)
end

make_bronbiala = function(menu_name)
	local elements = {
		{label = "Wytwórz Nóż",value = 'nozyk'},
		{label = "Wytwórz Machete",value = 'machete'},
		{label = "Wytwórz Kij basebolowy",value = 'baseball'}
	}
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'crafting',
	{
		title = menu_name,
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		local action = data.current.value
		if craft == false then
			craft = true
			TriggerServerEvent('yx_make:craftbronbiala', action)
		else
			ESX.ShowNotification('Jesteś w trakcie!')
		end
	ESX.UI.Menu.CloseAll()
	end, function(data, menu)
		menu.close()
	end)
end

local craft = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.Zones) do
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2) then
                    DisplayHelpText(v.Text)
                end
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 50) then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                end
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2) and IsControlJustReleased(0, 38) then
					menu_name = v.Name
					if v.menu_label == "make_weapons_biala" then
						make_bronbiala(menu_name)
					elseif v.menu_label == "make_metal" then
						make_jakies_gowna(menu)
				end
            end
        end
    end
end)

RegisterNetEvent('yx_make:shownotification')
AddEventHandler('yx_make:shownotification', function(message)
	ESX.ShowNotification(message)
end)
RegisterNetEvent('yx_make:startanim')
AddEventHandler('yx_make:startanim', function(source)
	TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
end)
RegisterNetEvent('yx_make:stopanim')
AddEventHandler('yx_make:stopanim', function(source)
	ClearPedTasksImmediately(GetPlayerPed(-1))
end)
RegisterNetEvent('yx_make:konieccraft')
AddEventHandler('yx_make:konieccraft', function(source)
	craft = false
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
