ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

-- Menu --
local open = false 
local Astuce = RageUI.CreateMenu('Astuce', 'Interaction')
local AstuceTouche = RageUI.CreateSubMenu(Astuce, "Touches", "Interaction")
local AstuceCommande = RageUI.CreateSubMenu(Astuce, "Commandes", "Interaction")
local AstuceUtilitaire = RageUI.CreateSubMenu(Astuce, "Utilitaires", "Interaction")
Astuce.Display.Header = true 
Astuce.Closed = function()
  open = false
end

function OpenAstuceMenu()
	if open then 
		open = false
		RageUI.Visible(Astuce, false)
		return
	else
		open = true 
		RageUI.Visible(Astuce, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(Astuce,function() 

			RageUI.Separator("Connecté en tant qu'id [~b~"..GetPlayerServerId(PlayerId()).."~s~]")
			RageUI.Separator("↓ ~b~   Astuce   ~s~↓")
			RageUI.Button("Touche", "Ouvrir le menu des touches", {RightLabel = "~y~→→→"}, true , {}, AstuceTouche)

			RageUI.Button("Commande", "Ouvrir le menu des commandes", {RightLabel = "~y~→→→"}, true , {}, AstuceCommande)

			RageUI.Button("Utilitaire", "Ouvrir le menu des utilitaires", {RightLabel = "~y~→→→"}, true , {}, AstuceUtilitaire)

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "~y~→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)

			-- Menu Astuce touche
			RageUI.IsVisible(AstuceTouche,function() 
			
			RageUI.Separator("↓ ~b~   Touches   ~s~↓")
			RageUI.Button("Téléphone", "sort votre téléphone", {RightLabel = "[F1]"}, true , {})
			RageUI.Button("Menu priincipale", "Ouvre le menu pricipale (inventaire, facture, vêtement ...)", {RightLabel = "[F5]"}, true , {})
			RageUI.Button("Menu sociéter", "Ouvre votre menu sociéter (Annonces, facture ...)", {RightLabel = "[F6]"}, true , {})
			RageUI.Button("Menu fouille", "Ouvre votre menu fouille", {RightLabel = "[F7]"}, true , {})
			RageUI.Button("Lever les bras", "lève vos bras", {RightLabel = "[F9]"}, true , {})

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "~y~→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)

			-- Menu Astuce commande
			RageUI.IsVisible(AstuceCommande,function() 

			RageUI.Separator("↓ ~b~   Commandes   ~s~↓")
			RageUI.Button("Menu astuce", "Ouvre le menu astuce", {RightLabel = "/help"}, true , {})
			RageUI.Button("Menu props", "Ouvre le menu props", {RightLabel = "/props"}, true , {})
			RageUI.Button("Lien discord", "Donne le lien discord", {RightLabel = "/discord"}, true , {})

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "~y~→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)
	
			-- Menu Astuce utilitaire
			RageUI.IsVisible(AstuceUtilitaire,function() 
	
			RageUI.Separator("↓ ~b~    Utilitaires    ~s~↓")
			RageUI.Button("Discord", "Vous envois le lien du discord", {RightLabel = "~y~→"}, true , {
				onSelected = function()
					ESX.ShowAdvancedNotification("Astuce", "Utilitaire", "Voici le lien du discord: ~b~https://discord.gg/dkHFBkBBPZ", "char_amanda", 1)
				end
			})

			RageUI.Separator("↓ ~r~    Fermeture    ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "~y~→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)
		Wait(0)
		end
	 end)
  end
end

-- Ouvrir le menu --
Citizen.CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(Config.positionAstuceMenu.InteractZone) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local pos = Config.positionAstuceMenu.InteractZone
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

			if dist <= 5.0 then
			wait = 0
			DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  

				if dist <= 5.0 then
				wait = 0
					Visual.Subtitle(Config.Text, 1) 
					if IsControlJustPressed(1,51) then
						OpenAstuceMenu()
					end
				end
			end
    	Citizen.Wait(wait)
    	end
	end
end)

-- Commande --
RegisterCommand("id", function(source, args, rawcommand)
    ESX.ShowAdvancedNotification("DPR Création", "ID", "Votre id est: [~y~~h~"..GetPlayerServerId(PlayerId()).."~s~] !", "CHAR_AGENT14", 8)
end, false)

RegisterCommand("discord", function(source, args, rawcommand)
    ESX.ShowAdvancedNotification("Astuce", "Utilitaire", "Voici le lien du discord: ~b~https://discord.gg/dkHFBkBBPZ", "char_amanda", 1)
end, false)

RegisterCommand("help", function(source, args, rawcommand)
    OpenAstuceMenu()
end, false)

-- Ped --
Citizen.CreateThread(function()
	if Config.Ped then
		function LoadModel(model)
			while not HasModelLoaded(model) do
				RequestModel(model)
				Wait(1)
			end
		end
		LoadModel(Config.PedType)
		Ped = CreatePed(2, GetHashKey(Config.PedType), Config.PedPosition, Config.PedRotation, 0, 0)
		DecorSetInt(Ped, "Desperados", 5431)
		FreezeEntityPosition(Ped, 1)
		SetEntityInvincible(Ped, true)
		SetBlockingOfNonTemporaryEvents(Ped, 1)
	end
end)

-- Blips --
Citizen.CreateThread(function()
    if Config.blip then
        for k, v in pairs(Config.positionAstuceMenu.InteractZone) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, Config.BlipId)
            SetBlipScale (blip, Config.BlipTaille)
            SetBlipColour(blip, Config.BlipCouleur)
            SetBlipAsShortRange(blip, Config.BlipRange)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipName)
            EndTextCommandSetBlipName(blip)
        end
    end
end)