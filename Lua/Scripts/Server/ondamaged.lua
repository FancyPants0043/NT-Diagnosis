-- This file will store your on damaged methods.

Hook.Add("character.applyDamage", "NTAddon.ondamaged", function(characterHealth, attackResult, hitLimb)
	--print(hitLimb.HealthIndex or hitLimb ~= nil)

	if -- invalid attack data, don't do anything
		characterHealth == nil
		or characterHealth.Character == nil
		or characterHealth.Character.IsDead
		or not characterHealth.Character.IsHuman
		or attackResult == nil
		or attackResult.Afflictions == nil
		or #attackResult.Afflictions <= 0
		or hitLimb == nil
		or hitLimb.IsSevered
		or not NTConfig.Get("NT_Calculations", true)
	then
		return
	end

	if not HF.HasAffliction(characterHealth.Character, "luabotomy") then
		HF.SetAffliction(characterHealth.Character, "luabotomy", 1)
	end

	local afflictions = attackResult.Afflictions

	-- ntc
	-- modifying ondamaged hooks
	for key, val in pairs(NTC.ModifyingOnDamagedHooks) do
		afflictions = val(characterHealth, afflictions, hitLimb)
	end

	local identifier = ""
	local methodtorun = nil
	for value in afflictions do
		-- execute fitting method, if available
		identifier = value.Prefab.Identifier.Value
		methodtorun = NTTHERM.OnDamagedMethods[identifier]
		if methodtorun ~= nil then
			-- make resistance from afflictions apply
			local resistance = HF.GetResistance(characterHealth.Character, identifier, hitLimb.type)
			local strength = value.Strength * (1 - resistance)

			methodtorun(characterHealth.Character, strength, hitLimb.type)
		end
	end

	-- ntc
	-- ondamaged hooks
	for key, val in pairs(NTC.OnDamagedHooks) do
		val(characterHealth, attackResult, hitLimb)
	end
end)

NTDiagnosis.OnDamagedMethods.gunshotwound= function(character, strength, limbtype)
end

NTDiagnosis.OnDamagedMethods.explosiondamage = function(character, strength, limbtype)
end

NTDiagnosis.OnDamagedMethods.bitewounds = function(character, strength, limbtype)
end

NTDiagnosis.OnDamagedMethods.lacerations = function(character, strength, limbtype)
end

NTDiagnosis.OnDamagedMethods.blunttrauma = function(character, strength, limbtype)
end

NTDiagnosis.OnDamagedMethods.internaldamage = function(character, strength, limbtype)
end