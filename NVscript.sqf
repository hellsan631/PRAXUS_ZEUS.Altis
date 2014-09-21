
if (isDedicated) exitWith {};
if (player != player) then {waitUntil {player == player};};

// Figures out how zoomed in you are (KillzoneKid is Awesome)
KK_fnc_getZoom = {
    (
        [0.5,0.5]
        distance
        worldToScreen
        positionCameraToWorld
        [0,1.05,1]
    ) * (
        getResolution
        select
        5
    )
};

while {true} do {

     // Adds Effects When NV Enabled
    waitUntil {((vehicle player) == player) && ((currentVisionMode player) == 1)};

    // Effects below. If you wanna know what this stuff means so you can change the effects, go to https://community.bistudio.com/wiki/Post_process_effects
    // Effect modifiers that change based on range like overall blur and film grain size are further down

    player say3D "nv_on";

    // Dynamic Blur
    ppBlur = ppEffectCreate ["dynamicBlur", 500];
    ppBlur ppEffectAdjust [0.2];
    ppBlur ppEffectCommit 0;
    ppBlur ppEffectEnable true;
    ppBlur ppEffectForceInNVG true;

    // Edge Blur
    ppRim = ppEffectCreate ["RadialBlur", 250];
    ppRim ppEffectAdjust [0.05, 0.05, 0.20, 0.28];
    ppRim ppEffectCommit 0;
    ppRim ppEffectEnable true;
    ppRim ppEffectForceInNVG true;

    // Color and Contrast
    ppColor = ppEffectCreate ["ColorCorrections", 1500];
    ppColor ppEffectEnable true;
    ppColor ppEffectAdjust [0.8, 0.8, -0.05, [0.4, 0.1, 0.4, 0.1], [0.3, 0.6, 0.5, 1], [0, 0, 0, 0]];
    ppColor ppEffectCommit 0;
    ppColor ppEffectForceInNVG true;

    // Film Grain
    ppFilm = ppEffectCreate ["FilmGrain", 2501];
    ppFilm ppEffectAdjust [0.18, 1, 1, 0.4, 0.2, false];
    ppFilm ppEffectEnable true;
    ppFilm ppEffectForceInNVG true;

    //Forces the light from the sky to be a consistant value
    //setApertureNew [50, 10, 100, 750];
    setAperture 17;

    // Halogen-Sound
    [] spawn {
        while {((currentVisionMode player) == 1)} do {
                playsound "halogen";
                sleep 2;
        };
    };

    waitUntil {
    // Scaling effects during Zooming

        _zoomintensity = (call kk_fnc_getZoom * 10) /30;

        ppBlur ppEffectAdjust [0.05 + (_zoomIntensity * 0.045)];
        ppBlur ppEffectCommit 0;

        ppFilm ppEffectAdjust [0.18, 1, _zoomIntensity, 0.4, 0.2, false];
        ppFilm ppEffectCommit 0;

        //Removes Effects When NV Disabled
        ((vehicle player) != player) || ((currentVisionMode player) != 1)

    };

    player say3D "nv_off";

    ppEffectDestroy ppBlur;
    ppEffectDestroy ppRim;
    ppEffectDestroy ppColor;
    ppEffectDestroy ppFilm;
    setAperture -1;
    //setApertureNew [-1, -1, -1, -1];
};
