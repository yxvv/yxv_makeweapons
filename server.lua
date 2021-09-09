ESX	= nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


RegisterServerEvent('yx_make:craftbronbiala')
AddEventHandler('yx_make:craftbronbiala', function(action)
	local _source = source
	local action = action
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomNumber = math.random(0,100)
	if action == 'nozyk' then
		if xPlayer.getInventoryItem('knife_blade').count >= 1 and xPlayer.getInventoryItem('knife_spring').count >= 1 and xPlayer.getInventoryItem('knife_handle').count >= 1 then
			xPlayer.removeInventoryItem('knife_blade', 1)
			xPlayer.removeInventoryItem('knife_spring', 1)
			xPlayer.removeInventoryItem('knife_handle', 1)
			TriggerClientEvent('esx:showNotification', _source, 'Tworzenie noża..')
			TriggerClientEvent('yx_make:startanim', _source)
			Citizen.Wait(5000)
			if randomNumber <= Config.szansa then
				xPlayer.addInventoryItem('switchblade', 1)
				TriggerClientEvent('esx:showNotification', _source, 'Otrzymałeś nóż')
			else
				TriggerClientEvent('esx:showNotification', _source, 'Kawałek metalu rozciął ci palec...')
			end
			TriggerClientEvent('yx_make:stopanim', _source)
			TriggerClientEvent('yx_make:konieccraft', _source)
		else
			TriggerClientEvent('esx:showNotification', _source, 'Nie posiadasz wymaganych materiałów!')
			TriggerClientEvent('yx_make:konieccraft', _source)
		end
	elseif action == 'machete' then
		if xPlayer.getInventoryItem('knife_handle').count >= 1 and xPlayer.getInventoryItem('knife_blade').count >= 1 and xPlayer.getInventoryItem('weapon_tape').count >= 1 then
			xPlayer.removeInventoryItem('knife_handle', 1)
			xPlayer.removeInventoryItem('knife_blade', 1)
			xPlayer.removeInventoryItem('weapon_tape', 1)
			TriggerClientEvent('esx:showNotification', _source, 'Tworzenie Machete..')
			TriggerClientEvent('yx_make:startanim', _source)
			Citizen.Wait(5000)
			if randomNumber <= Config.szansa then
				xPlayer.addInventoryItem('machete', 1)
				TriggerClientEvent('esx:showNotification', _source, 'Otrzymałeś Machete')
			else
				TriggerClientEvent('esx:showNotification', _source, 'Kawałek metalu rozciął ci palec...')
			end
			TriggerClientEvent('yx_make:stopanim', _source)
			TriggerClientEvent('yx_make:konieccraft', _source)
		else
			TriggerClientEvent('esx:showNotification', _source, 'Nie posiadasz wymaganych materiałów!')
			TriggerClientEvent('yx_make:konieccraft', _source)
		end
	elseif action == 'baseball' then
		if xPlayer.getInventoryItem('bat_base').count >= 1 and xPlayer.getInventoryItem('weapon_tape').count >= 1 then
			xPlayer.removeInventoryItem('bat_base', 1)
			xPlayer.removeInventoryItem('weapon_tape', 1)
			TriggerClientEvent('esx:showNotification', _source, 'Tworzenie Baseballa..')
			TriggerClientEvent('yx_make:startanim', _source)
			Citizen.Wait(5000)
			if randomNumber <= Config.szansa then
				xPlayer.addInventoryItem('bat', 1)
				TriggerClientEvent('esx:showNotification', _source, 'Otrzymałeś Baseballa')
			else
				TriggerClientEvent('esx:showNotification', _source, 'Kawałek metalu rozciął ci palec...')
			end
			TriggerClientEvent('yx_make:stopanim', _source)
			TriggerClientEvent('yx_make:konieccraft', _source)
		else
			TriggerClientEvent('esx:showNotification', _source, 'Nie posiadasz wymaganych materiałów!')
			TriggerClientEvent('yx_make:konieccraft', _source)
		end
	end
end)



RegisterServerEvent('yx_make:craftgowno')
AddEventHandler('yx_make:craftgowno', function(action)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomNumber = math.random(0,100)
    local szansa = 40
	TriggerClientEvent('esx:showNotification', _source, 'Wytwarzanie przedmiotu..')
	TriggerClientEvent('yx_make:startanim', _source)
	Citizen.Wait(5000)
	if action == 'knife_handle' then
        if randomNumber <= szansa then
		    xPlayer.addInventoryItem('knife_handle', 1)
	    end
	elseif action == 'knife_blade' then
if randomNumber <= szansa then
			xPlayer.addInventoryItem('knife_blade', 1)
end
	elseif action == 'weapon_tape' then
if randomNumber <= szansa then
			xPlayer.addInventoryItem('weapon_tape', 1)
end
	elseif action == 'knife_spring' then
if randomNumber <= szansa then
			xPlayer.addInventoryItem('knife_spring', 1)
end
	elseif action == 'knuckle_base' then
if randomNumber <= szansa then
			xPlayer.addInventoryItem('knuckle_base', 1)
end
	elseif action == 'bat_base' then
if randomNumber <= szansa then
			xPlayer.addInventoryItem('bat_base', 1)
        end
    end
    TriggerClientEvent('yx_make:stopanim', _source)
	TriggerClientEvent('yx_make:craftend', _source)

end)