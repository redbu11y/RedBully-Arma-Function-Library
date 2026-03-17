params ["_wreck", "_player", "_carrier"];

if (!local _carrier) exitWith {
	[_wreck, _player, _carrier] remoteExecCall ["FBM_fnc_loadWreck", _carrier];
};

if (damage _wreck < 0) exitWith {false};
if !([_carrier] call FBM_fnc_isValidWreckCarrier) exitWith {false};
if (!isNull (_carrier getVariable ["FBM_loadedWreck", objNull])) exitWith {false};

private _attachOffset = [_carrier, _wreck] call FBM_fnc_getCarrierAttachOffset;
if (_attachOffset isEqualTo []) exitWith {false};

private _dirOffset = [_carrier] call FBM_fnc_getCarrierDirOffset;

//_wreck allowDamage false;
//_wreck enableSimulationGlobal false;

_wreck attachTo [_carrier, _attachOffset];
_wreck setDir ((getDir _carrier) + _dirOffset);
_wreck setVectorDirAndUp [[0,1,0],[0,0,1]];

_wreck setVariable ["FBM_wreckCarrier", _carrier, true];
_wreck setVariable ["FBM_isLoadedWreck", true, true];
_carrier setVariable ["FBM_loadedWreck", _wreck, true];

true
