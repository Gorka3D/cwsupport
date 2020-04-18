ATTACHMENT_SIGHT = 1
ATTACHMENT_BARREL = 2
ATTACHMENT_LASER = 3
ATTACHMENT_MAGAZINE = 4
ATTACHMENT_GRIP = 5

local attItems = {}
attItems.att_kobra = {
    name = "Mira Kobra",
    desc = "Mira reflex.",
    slot = ATTACHMENT_SIGHT,
    attSearch = {
        "kry_metro_kollimator",
    }
}
attItems.att_scopex2 = {
    name = "Mira x2",
    desc = "Mira que tiene x2 de zoom.",
    slot = ATTACHMENT_SIGHT,
    attSearch = {
        "kry_metro_optika1",
        "kry_metro_ventil_optika",
    }
}
attItems.att_ir = {
    name = "Mira IR",
    desc = "Mira infraroja.",
    slot = ATTACHMENT_SIGHT,
    attSearch = {
        "kry_metro_optika_ir",
    }
}
attItems.att_sup = {
    name = "Silenciador",
    desc = "Reduce considerablemente el ruido de salida.",
    slot = ATTACHMENT_BARREL,
    attSearch = {
        "kry_metro_duplet_silencer",
        "kry_metro_glushak",
        "kry_metro_glushak_revolver",
    },
}
attItems.att_laser = {
    name = "Puntero Laser",
    desc = "Emite una luz roja.",
    slot = ATTACHMENT_LASER,
    attSearch = {
        "kry_metro_laser",
    }
}
attItems.att_mag = {
    name = "Cargador Ampliado",
    desc = "Aumenta la capacidad del balas del cargador.",
    slot = ATTACHMENT_MAGAZINE,
    attSearch = {
        "kry_metro_ak_mag_45",
        "kry_metro_ak_mag_60",
        "kry_metro_saiga_mag_20",
        "kry_metro_ventil_mag",
    }
}

local function attachment(item, data, combine)
    local client = item.player
    local char = client:getChar()
    local inv = char:getInv()
    local items = inv:getItems()

    local target = data

    -- This is the only way, ffagot
    for k, invItem in pairs(items) do
        if (data) then
            if (invItem:getID() == data) then
                target = invItem

                break
            end
        else
            if (invItem.isWeapon and invItem.isCW) then
                target = invItem

                break
            end
        end
    end

    if (!target) then
        client:notifyLocalized("noWeapon")

        return false
    else
        local class = target.class
        local SWEP = weapons.Get(class)

        if (target.isCW) then
            -- Insert Weapon Filter here if you just want to create weapon specific shit. 
            local atts = SWEP.Attachments
            local mods = target:getData("mod", {})
            
            if (atts) then		                                
                -- Is the Weapon Slot Filled?
                if (mods[item.slot]) then
                    client:notifyLocalized("alreadyAttached")

                    return false
                end

                local pokemon

                for atcat, data in pairs(atts) do
                    if (pokemon) then
                        break
                    end
                    
                    for k, name in pairs(data.atts) do
                        if (pokemon) then
                            break
                        end

                        for _, doAtt in pairs(item.attSearch) do
                            if (name == doAtt) then
                                pokemon = doAtt
                                break
                            end
                        end
                    end
                end

                if (!pokemon) then
                    client:notifyLocalized("cantAttached")

                    return false
                end

                mods[item.slot] = {item.uniqueID, pokemon}
                target:setData("mod", mods)
                local wepon = client:GetActiveWeapon()

                -- If you're holding right weapon, just mod it out.
                if (IsValid(wepon) and wepon:GetClass() == target.class) then
                    wepon:attachSpecificAttachment(pokemon)
                end
                
				-- Yeah let them know you did something with your dildo
				client:EmitSound("cw/holster4.wav")

                return true
            else
                client:notifyLocalized("notCW")
            end
        end
    end

    client:notifyLocalized("noWeapon")
    return false
end

for className, v in pairs(attItems) do
    print(attItems)
	local ITEM = nut.item.register(className, nil, nil, nil, true)
	ITEM.name = className
	ITEM.desc = v.desc
	ITEM.price = 1000
	ITEM.model = "models/Items/BoxSRounds.mdl"
	ITEM.width = 1
	ITEM.height = 1
	ITEM.isAttachment = true
	ITEM.category = "Attachments"
    ITEM.attSearch = v.attSearch
    ITEM.slot = v.slot

	ITEM.functions.use = {
        name = "Attach",
        tip = "useTip",
        icon = "icon16/wrench.png",
        isMulti = true,
        multiOptions = function(item, client)
            local targets = {}
            local char = client:getChar()
            
            if (char) then
                local inv = char:getInv()

                if (inv) then
                    local items = inv:getItems()

                    for k, v in pairs(items) do
                        if (v.isWeapon and v.isCW) then
                            table.insert(targets, {
                                name = L(v.name),
                                data = v:getID(),
                            })
                        else
                            continue
                        end
                    end
                end
            end

            return targets
        end,
        onCanRun = function(item)				
            return (!IsValid(item.entity))
        end,
        onRun = function(item, data)
            return attachment(item, data, false)
		end,
	}

    function ITEM:onCombine(other)
        print(other)
        if (other.isWeapon and other.isCW) then
            attachment(item, other:getID(), true)
        end
    end
end

local conversionKits = {}
-- planned feature
-- make a package of weapon converter.
-- like MP5 to MP5SD (yeah seriously)