function onCreatePost()
    setTimeBarColors('e66965', '4d2e3c');
end

function onGameOver()
    if isAchievementUnlocked('neander') == false and keyJustPressed('reset') == false then
      unlockAchievement('neander')
    end
end