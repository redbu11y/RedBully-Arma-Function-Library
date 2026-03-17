params ["_vehicles", "_statement", "_target"];

private _actions = _vehicles apply {
    private _name = getText (configOf _x >> "displayName");
    private _distanceStr = (player distance _x) toFixed 1;
    private _icon = [_x] call ace_common_fnc_getVehicleIcon;

    private _action = [
        str _x,
        format ["%1 (%2m)", _name, _distanceStr],
        _icon,
        _statement,
        {true},
        {},
        _x
    ] call ace_interact_menu_fnc_createAction;

    [_action, [], _target]
};

_actions