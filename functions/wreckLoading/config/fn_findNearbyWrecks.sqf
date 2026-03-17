params ["_carrier", ["_radius", 16]];

private _nearby = nearestObjects [_carrier, ["LandVehicle"], _radius];

_nearby select {
    _x != _carrier
    && {damage _x >= 1}
    && {isNull (_x getVariable ["FBM_wreckCarrier", objNull])}
    && {!(([_carrier, _x] call FBM_fnc_getCarrierAttachOffset) isEqualTo [])}
}