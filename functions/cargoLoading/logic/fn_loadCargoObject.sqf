params ["_carrier", "_cargo"];

if !([_carrier] call FBM_fnc_isValidCargoCarrier) exitWith {false};
if !([_cargo] call FBM_fnc_isValidCargoObject) exitWith {false};

private _check = _carrier canVehicleCargo _cargo;
if !(_check # 0) exitWith {false};

_carrier setVehicleCargo _cargo

