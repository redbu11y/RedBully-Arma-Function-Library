params ["_carrier"];

private _statement = {
    params ["_target", "_player", "_cargo"];

    [
        5,
        [_target, _cargo],
        {
            params ["_args", "_elapsedTime"];
            _args params ["_carrier", "_cargo"];
            [_carrier, _cargo] call FBM_fnc_loadCargoObject;
        },
        {
            params ["_args", "_elapsedTime"];
            _args params ["_carrier", "_cargo"];
            alive _player
            && {_player distance _carrier < 6}
            && {_player distance _cargo < 16}
        },
        "Loading cargo..."
    ] call ace_common_fnc_progressBar;
};

private _objects = [_carrier, 15] call FBM_fnc_findNearbyCargoObjects;

[_objects, _statement, _carrier] call FBM_fnc_createCargoActions