params ["_carrier", "_wreck"];

private _cfg = [_carrier] call FBM_fnc_getWreckCarrierConfig;
if ((count _cfg) == 0) exitWith {[]};

private _category = [_wreck] call FBM_fnc_getWreckCategory;

if (_category == "car") exitWith {
    _cfg getOrDefault ["carAttach", []]
};

if !(_cfg getOrDefault ["allowHeavy", false]) exitWith {
    []
};

_cfg getOrDefault ["heavyAttach", []]