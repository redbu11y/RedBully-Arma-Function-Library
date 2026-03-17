params ["_target"];

private _loaded = _target getVariable ["FBM_loadedWreck", objNull];
if (!isNull _loaded) exitWith {_target};

private _carrier = _target getVariable ["FBM_wreckCarrier", objNull];
if (!isNull _carrier) exitWith {_carrier};

objNull