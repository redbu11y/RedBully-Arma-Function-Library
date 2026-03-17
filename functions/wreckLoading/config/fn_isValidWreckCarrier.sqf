params ["_vehicle"];

private _cfg = [_vehicle] call FBM_fnc_getWreckCarrierConfig;
(count _cfg) > 0