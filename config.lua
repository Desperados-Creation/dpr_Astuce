--------------------------------------------------------------------------------------------------
-- Script par Desperados#0001                                                                   -- 
-- Lien du discord pour toute mes créations: https://discord.gg/dkHFBkBBPZ                      --
-- Lien du github pour télécharger le script: https://github.com/Desperados-Creation/dpr_Astuce --
--------------------------------------------------------------------------------------------------

Config = {
    blip = true, -- Affichage du blip (true = oui, false = non)

    BlipName = 'Astuce', -- Nom du blip
    BlipId = 66, -- Id du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipTaille = 0.7, -- Taille du blip
    BlipCouleur = 83, -- Couleur du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipRange = true, -- Garder le blip sur la map (true = désactiver, false = activé)


    Ped = true,

    PedType = 'csb_reporter',
    PedPosition = vector3(-486.53, -678.7, 31.83),
    PedRotation = 131.33,

    
    MarkerType = 32, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.3, -- Largeur du marker
    MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
    MarkerSizeHauteur = 0.3, -- Hauteur du marker
    MarkerDistance = 10.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    Text = "Appuyer sur ~b~[E]~s~ pour ouvrir le menu des ~b~astuces ~s~!", -- Text écris lors de l'approche du blip voir: https://discord.gg/dkHFBkBBPZ Channel couleur pour changer la couleur du texte 

    positionAstuceMenu = { -- Position du menu astuce sur la map
        InteractZone = {
            vector3(-487.3, -679.43, 32.85),
        }
    }
}
