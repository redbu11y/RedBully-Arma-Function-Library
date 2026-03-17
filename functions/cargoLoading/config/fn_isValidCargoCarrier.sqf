params ["_veh"];


if !(vehicleCargoEnabled _veh) exitWith {false};
if (damage _veh >= 1) exitWith {false};

private _carrierCfg = configOf _veh >> "VehicleTransport" >> "Carrier";
if !(isClass _carrierCfg) exitWith {false};

//return
(getNumber (_carrierCfg >> "maxLoadMass")) > 0