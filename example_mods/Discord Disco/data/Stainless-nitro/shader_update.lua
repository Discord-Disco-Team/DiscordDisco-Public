function onCreate()
    initLuaShader('HeatwaveShader');

    makeLuaSprite('caShader', '', 0, 0);
    setSpriteShader('caShader', 'HeatwaveShader');
    setShaderFloat('caShader', 'amount', -0.2);

    makeLuaSprite('heatwaveShader', '', 0, 0);
    setSpriteShader('heatwaveShader', 'HeatwaveShader');
    setShaderSampler2D('heatwaveShader', 'distortTexture', 'heatwave');
    runHaxeCode([[
        var filter:ShaderFilter = new ShaderFilter(game.getLuaObject('heatwaveShader').shader);

        game.camGame.setFilters([filter]);
    ]]);
end