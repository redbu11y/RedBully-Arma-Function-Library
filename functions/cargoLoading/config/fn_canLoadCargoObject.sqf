params ["_carrier", "_obj"];

if !([_carrier] call FBM_fnc_isValidCargoCarrier) exitWith {false};
if !([_obj] call FBM_fnc_isValidCargoObject) exitWith {false};

private _result = _carrier canVehicleCargo _obj;
_result # 0