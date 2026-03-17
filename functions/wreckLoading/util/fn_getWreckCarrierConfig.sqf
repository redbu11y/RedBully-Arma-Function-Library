params ["_carrier"];

private _cfgMap = missionNamespace getVariable ["FBM_wreckCarrierConfig", createHashMap];
private _cfg = createHashMap;

{
    if (_carrier isKindOf _x) exitWith {
        _cfg = _cfgMap get _x;
    };
} forEach (keys _cfgMap);

_cfg