params ["_carrier"];

private _statement = {
    params ["_target", "_player", "_cargo"];

    [
        5,
        [_target, _cargo, _player],
        {
            params ["_args", "_elapsedTime"];
            _args params ["_carrier", "_cargo", "_player"];
            [_cargo] call FBM_fnc_unloadCargoObject;
        },
        {
            params ["_args", "_elapsedTime"];
            _args params ["_carrier", "_cargo", "_player"];
            alive _player
            && {_player distance _carrier < 6}
        },
        "Unloading cargo..."
    ] call ace_common_fnc_progressBar;
};

private _objects = getVehicleCargo _carrier;

[_objects, _statement, _carrier] call FBM_fnc_createCargoActions