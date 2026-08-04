-- This file will store your new addon afflictions.

NTAddon.UpdateLimbAfflictions = {

	-- example_limb_aff
	example_limb_aff = {
		update = function(c, i)
		end,
	},

}

NTAddon.UpdateAfflictions = {

	-- example_aff
	example_aff = {
		update = function(c, i)
		end,
	},

}


-- Afflictions used for blood related stuff.
NTAddon.UpdateBloodAfflictions = {

	-- example_blood_aff
	example_blood_aff = {
		update = function (c, i)
		end
	},

}

-- Add to Neuro Limb Afflictions.
for k, v in pairs(NTAddon.UpdateLimbAfflictions) do
	NT.LimbAfflictions[k] = v
end

-- Add to Neuro Afflictions.
for k, v in pairs(NTAddon.UpdateAfflictions) do
	NT.Afflictions[k] = v
end

-- Add to neuro afflictions
for k, v in pairs(NTAddon.UpdateBloodAfflictions) do 
	NT.Afflictions[k] = v
end