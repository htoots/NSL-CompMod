-- Three chambers gives 75% silence
function Gore:GetEffectParams(tableParams)
    local player = self:GetParent()
    if player then
        local silenceLevel = player.silenceLevel or 0
        tableParams[kEffectFilterSilenceUpgrade] = false
        tableParams[kEffectParamVolume] = 1 - Clamp(silenceLevel / 4, 0, 0.75)
    end
end