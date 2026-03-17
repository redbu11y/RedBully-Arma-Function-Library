if (isDedicated) exitWith {};
if (!hasInterface) exitWith {};

[
    {
        !isNil "ace_interact_menu_fnc_createAction"
        && {!isNil "ace_interact_menu_fnc_addActionToClass"}
        && {!isNull player}
    },
    {
        private _loadAction = [
            "FBM_LoadCargoObject",
            "Load object",
            "",
            { true },
            {
                params ["_target", "_player", "_params"];
                [_target] call FBM_fnc_isValidCargoCarrier
            },
            {
                params ["_target", "_player", "_params"];
                [_target] call FBM_fnc_addNearbyCargoActions
            }
        ] call ace_interact_menu_fnc_createAction;

        ["AllVehicles", 0, ["ACE_MainActions"], _loadAction, true] call ace_interact_menu_fnc_addActionToClass;

        private _unloadAction = [
            "FBM_UnloadCargoObject",
            "Unload object",
            "",
            { true },
            {
                params ["_target", "_player", "_params"];
                [_target] call FBM_fnc_isValidCargoCarrier
                && {count ([_target] call FBM_fnc_findLoadedCargoObjects) > 0}
            },
            {
                params ["_target", "_player", "_params"];
                [_target] call FBM_fnc_addLoadedCargoActions
            }
        ] call ace_interact_menu_fnc_createAction;

        ["AllVehicles", 0, ["ACE_MainActions"], _unloadAction, true] call ace_interact_menu_fnc_addActionToClass;
    }
] call CBA_fnc_waitUntilAndExecute;