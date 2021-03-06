local kClusterGrenadeBurnDuration = 4
local kBurnUpdateRate = 0.5 -- same as vanilla

-- fire from cluster grenades burns for less time
local function SharedUpdate(self, deltaTime)
    PROFILE("FireMixin:OnUpdate")
    if Client then
        UpdateFireMaterial(self)
        self:_UpdateClientFireEffects()
    end

    if not self:GetIsOnFire() then
        return
    end

    if Server then
        local time = Shared.GetTime()
        if self:GetIsAlive() and (not self.timeLastFireDamageUpdate or self.timeLastFireDamageUpdate + kBurnUpdateRate <= time) then
            local damageOverTime = kBurnUpdateRate * kBurnDamagePerSecond
            if self.GetIsFlameAble and self:GetIsFlameAble() then
                damageOverTime = damageOverTime * kFlameableMultiplier
            end

            local attacker = nil
            if self.fireAttackerId ~= Entity.invalidId then
                attacker = Shared.GetEntity(self.fireAttackerId)
            end

            local doer = nil
            if self.fireDoerId ~= Entity.invalidId then
                doer = Shared.GetEntity(self.fireDoerId)
            end

            local killedFromDamage, damageDone = self:DeductHealth(damageOverTime, attacker, doer)

            if attacker then
                SendDamageMessage(attacker, self, damageDone, self:GetOrigin(), damageDone)
            end

            self.timeLastFireDamageUpdate = time
        end

        local burnDuration = kFlamethrowerBurnDuration

        -- Check what burned us, change the burn time
        if self.fireDoerName == ClusterGrenade.kMapName then
            burnDuration = kClusterGrenadeBurnDuration
        end

        -- See if we put ourselves out
        if time - self.timeBurnRefresh > burnDuration then
            self:SetGameEffectMask(kGameEffect.OnFire, false)
        end
    end
end

-- Use the new function
function FireMixin:OnUpdate(deltaTime)
    SharedUpdate(self, deltaTime)
end

-- Track the name of what burned us, even if the entity is destroyed
-- (only tracks cluster grenade and flamethrower)
function FireMixin:SetOnFire(attacker, doer)
    if Server and not self:GetIsDestroyed() then
        if not self:GetCanBeSetOnFire() then
            return
        end

        self:SetGameEffectMask(kGameEffect.OnFire, true)

        if attacker then
            self.fireAttackerId = attacker:GetId()
        end

        if doer then
            self.fireDoerId = doer:GetId()

            -- Store the name of what burned us
            -- Not a general solution but works for now
            if doer:isa("ClusterGrenade") then 
                self.fireDoerName = ClusterGrenade.kMapName
            else
                self.fireDoerName = Flamethrower.kMapName
            end
        end

        local time = Shared.GetTime()
        self.timeBurnRefresh = time
        self.timeLastFireDamageUpdate = time
        self.isOnFire = true
    end
end
