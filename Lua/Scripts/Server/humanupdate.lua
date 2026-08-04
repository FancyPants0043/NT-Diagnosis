-- This file will store your new addon afflictions.

NTDiagnosis.UpdateLimbAfflictions = {

	-- example_limb_aff
	example_limb_aff = {
		update = function(c, i)
		end,
	},

}

NTDiagnosis.UpdateAfflictions = {

	-- example_aff
	example_aff = {
		update = function(c, i)
		end,
	},

}


-- Afflictions used for blood related stuff.
NTDiagnosis.UpdateBloodAfflictions = {

	-- example_blood_aff
	example_blood_aff = {
		update = function (c, i)
		end
	},

}

-- Add to Neuro Limb Afflictions.
for k, v in pairs(NTDiagnosis.UpdateLimbAfflictions) do
	NT.LimbAfflictions[k] = v
end

-- Add to Neuro Afflictions.
for k, v in pairs(NTDiagnosis.UpdateAfflictions) do
	NT.Afflictions[k] = v
end

-- Add to neuro afflictions
for k, v in pairs(NTDiagnosis.UpdateBloodAfflictions) do 
	NT.Afflictions[k] = v
end