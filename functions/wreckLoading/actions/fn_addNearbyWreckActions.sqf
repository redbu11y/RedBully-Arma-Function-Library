params ["_carrier"];

private _statement = {
    params ["_target", "_player", "_wreck"];

    [
        5,
        [_wreck, _player, _target],
        {
            params ["_args", "_elapsedTime"];
            _args params ["_wreck", "_player", "_carrier"];
            [_wreck, _player, _carrier] call FBM_fnc_loadWreck;
        },
        {
            params ["_args", "_elapsedTime"];
            _args params ["_wreck", "_player", "_carrier"];

            alive _player
            && {_player distance _carrier < 14}
            && {_player distance _wreck < 14}
            && {isNull (_wreck getVariable ["FBM_wreckCarrier", objNull])}
            && {isNull (_carrier getVariable ["FBM_loadedWreck", objNull])}
        },
        "Loading wreck..."
    ] call ace_common_fnc_progressBar;
};

private _nearby = nearestObjects [_carrier, ["LandVehicle"], 20];

private _wrecks = _nearby select {
    _x != _carrier
    && {damage _x >= 1}
    && {isNull (_x getVariable ["FBM_wreckCarrier", objNull])}
    && {_carrier distance _x < 14}
    && {!(([_carrier, _x] call FBM_fnc_getCarrierAttachOffset) isEqualTo [])}
};

[_wrecks, _statement, _carrier] call FBM_fnc_createWreckCarrierActions