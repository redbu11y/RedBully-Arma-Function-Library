params ["_carrier", ["_radius", 15]];

private _nearby = nearestObjects [_carrier, [], _radius];

_nearby select {
    _x != _carrier
    && {[_x] call FBM_fnc_isValidCargoObject}
    && {([_carrier, _x] call FBM_fnc_canLoadCargoObject)}
}