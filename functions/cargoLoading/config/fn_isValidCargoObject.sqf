params ["_obj"];

private _manualWhitelist = missionNamespace getVariable ["FBM_cargoObjectWhitelist", []];

if !(simulationEnabled _obj) exitWith {false};
if !(isNull (isVehicleCargo _obj)) exitWith {false};
if (!isNull attachedTo _obj) exitWith {false};
if (_obj isKindOf "Man") exitWith {false};
if ((getObjectType _obj) in [1,2]) exitWith {false};

if (typeOf _obj in _manualWhitelist) exitWith {true};

if (_obj isKindOf "LandVehicle" || {_obj isKindOf "Air"}) exitWith {
    if (locked _obj >= 2) exitWith {false};
    if ((count crew _obj) > 0) exitWith {false};
    true
};

private _hasDriver = (_obj emptyPositions "driver") > 0;
private _hasCargo = (_obj emptyPositions "cargo") > 0;
private _hasGunner = (_obj emptyPositions "gunner") > 0;
private _hasCommander = (_obj emptyPositions "commander") > 0;

!(_hasDriver || _hasCargo || _hasGunner || _hasCommander)