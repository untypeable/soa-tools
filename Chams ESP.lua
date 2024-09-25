local PlayerService = game:GetService("Players")

while true do
    for _, player in pairs(PlayerService:GetPlayers()) do
        if player.Character ~= nil then
            if not player.Character:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight")
                highlight.Parent = player.Character
            end
        end
    end
    wait(1)
end
