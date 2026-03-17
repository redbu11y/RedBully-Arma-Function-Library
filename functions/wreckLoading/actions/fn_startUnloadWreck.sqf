params ["_target", "_player"];

private _carrier = [_target] call FBM_fnc_getUnloadCarrier;
if (isNull _carrier) exitWith {
    systemChat "No carrier found";
};

[
    5,
    [_carrier, _player],
    {
        params ["_args", "_elapsedTime"];
        _args params ["_carrier", "_player"];
        [_carrier] call FBM_fnc_unloadWreck;
    },
    {
        params ["_args", "_elapsedTime"];
        _args params ["_carrier", "_player"];

        alive _player
        && {_player distance _carrier < 14}
        && {!isNull (_carrier getVariable ["FBM_loadedWreck", objNull])}
    },
    "Unloading wreck..."
] call ace_common_fnc_progressBar;