params ["_wreck"];

private _statement = {
    params ["_target", "_player", "_carrier"];

    [
        5,
        [_target, _player, _carrier],
        {
            params ["_args", "_elapsedTime"];
            _args params ["_wreck", "_player", "_carrier"];
            [_wreck, _player, _carrier] call FBM_fnc_loadWreck;
        },
        {
            params ["_args", "_elapsedTime"];
            _args params ["_wreck", "_player", "_carrier"];

            alive _player
            && {_player distance _wreck < 14}
            && {_player distance _carrier < 14}
            && {isNull (_wreck getVariable ["FBM_wreckCarrier", objNull])}
            && {isNull (_carrier getVariable ["FBM_loadedWreck", objNull])}
        },
        "Loading wreck..."
    ] call ace_common_fnc_progressBar;
};

private _nearby = nearestObjects [_wreck, ["LandVehicle"], 20];

private _vehicles = _nearby select {
    _x != _wreck
    && {alive _x}
    && {locked _x < 2}
    && {[_x] call FBM_fnc_isValidWreckCarrier}
    && {isNull (_x getVariable ["FBM_loadedWreck", objNull])}
    && {_wreck distance _x < 16}
    && !(([_x, _wreck] call FBM_fnc_getCarrierAttachOffset) isEqualTo [])
};

[_vehicles, _statement, _wreck] call FBM_fnc_createWreckCarrierActions