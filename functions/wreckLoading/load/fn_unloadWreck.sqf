params ["_carrier"];

if (!local _carrier) exitWith {
	[_carrier] remoteExecCall ["FBM_fnc_unloadWreck", _carrier];
};

private _wreck = _carrier getVariable ["FBM_loadedWreck", objNull];
if (isNull _wreck) exitWith {false};

private _detachOffset = [_carrier] call FBM_fnc_getCarrierDetachOffset;
private _dropPos = _carrier modelToWorld _detachOffset;

detach _wreck;
_wreck setPosATL _dropPos;
_wreck setDir (getDir _carrier);
_wreck setVectorDirAndUp [[sin (getDir _carrier), cos (getDir _carrier), 0], [0,0,1]];
_wreck setVelocity [0,0,0];
_wreck enableSimulationGlobal true;

/*
[_wreck] spawn {
	params ["_wreck"];
	uiSleep 0.2;
	_wreck allowDamage true;
};
*/
_wreck setVariable ["FBM_wreckCarrier", objNull, true];
_wreck setVariable ["FBM_isLoadedWreck", false, true];
_carrier setVariable ["FBM_loadedWreck", objNull, true];

true
