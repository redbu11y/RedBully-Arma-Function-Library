params ["_carrier"];

private _cfg = [_carrier] call FBM_fnc_getWreckCarrierConfig;
_cfg getOrDefault ["detach", [0, -8, 0]]