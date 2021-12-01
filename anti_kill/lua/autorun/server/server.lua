util.AddNetworkString("_SuicideSuccessfull")
util.AddNetworkString("_SuicideUnSuccessfull")

local delay = ANTIKILL.Cooldown
local lastOccurance = -delay
function NewSuicideScript(ply)
    if !IsValid(ply) then return end
    local timeElapsed = CurTime() - lastOccurance
    local timeLeft = delay-timeElapsed
    if timeElapsed < delay then
        net.Start("_SuicideUnSuccessfull", false)
        net.WriteInt(timeLeft, 12)
        net.Send(ply)
        return false
    else
        net.Start("_SuicideSuccessfull", false)
        net.Send(ply)
        lastOccurance = CurTime()
        return true
    end
end
hook.Add("CanPlayerSuicide", "_NewSuicideScript", NewSuicideScript)

function CustomChatSound(ply, text, teamChat)

end
hook.Add("OnPlayerChat", "CustomChatSound_", CustomChatSound)