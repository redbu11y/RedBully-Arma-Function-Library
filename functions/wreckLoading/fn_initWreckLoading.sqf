if (isDedicated) exitWith {};
if (!hasInterface) exitWith {};

private _wreckCarrierConfig = createHashMapFromArray [
	[
		"PRACS_M450",
		createHashMapFromArray [
			["carAttach",   [-0.06, -3.5, 3.5]],
			["heavyAttach", [-0.06, -4.7, 3.6]],
			["allowHeavy", true],
			["detach",      [-0.06, -13, 2]],
			["dir",         180]
		]
	],
	[
		"Truck_01_viv_base_F",
		createHashMapFromArray [
			["carAttach",   [0, -1.8, 1.3]],
			["heavyAttach", [0, -1.4, 1.3]],
			["allowHeavy", true],
			["detach",      [0, -8, 1]],
			["dir",         180]
		]
	],
	[
		"UK3CB_Ural_Recovery_Base",
		createHashMapFromArray [
			["carAttach",   [0, -2, 1.7]],
			["heavyAttach", [0, -1.4, 1.8]],
			["allowHeavy", false],
			["detach",      [0, -8.5, 1]],
			["dir",         180]
		]
	],
	[
		"UK3CB_MAZ_543_Recovery",
		createHashMapFromArray [
			["carAttach",   [0, -0.5, -1.3]],
			["heavyAttach", [0, 0.5, -1.4]],
			["allowHeavy", true],
			["detach",      [0, -9, -1]],
			["dir",         180]
		]
	],
	[
		"UK3CB_M939_Recovery",
		createHashMapFromArray [
			["carAttach",   [0, -1.8, 1.8]],
			["heavyAttach", [0, -1.8, 1.8]],
			["allowHeavy", false],
			["detach",      [0, -9, 1.7]],
			["dir",         180]
		]
	],
	[
		"UK3CB_T810_Recovery",
		createHashMapFromArray [
			["carAttach",   [0, -1.6, 1.6]],
			["heavyAttach", [0, -1.3, 1.6]],
			["allowHeavy", false],
			["detach",      [0, -9, 1.6]],
			["dir",         180]
		]
	],
	[
		"UK3CB_V3S_Recovery",
		createHashMapFromArray [
			["carAttach",   [0, -1.2, 1.6]],
			["heavyAttach", [0, -1.1, 1.6]],
			["allowHeavy", false],
			["detach",      [0, -8, 1.6]],
			["dir",         180]
		]
	],
	[
		"UK3CB_M977A4_Recovery_Base",
		createHashMapFromArray [
			["carAttach",   [0, -1.6, 2]],
			["heavyAttach", [0, -1, 1.8]],
			["allowHeavy", true],
			["detach",      [0, -9, 1.8]],
			["dir",         180]
		]
	],
	[
		"UK3CB_MTVR_Recovery",
		createHashMapFromArray [
			["carAttach",   [0, -1.7, 1.6]],
			["heavyAttach", [0, -1.4, 1.6]],
			["allowHeavy", true],
			["detach",      [0, -9, 1.6]],
			["dir",         180]
		]
	],
	[
		"RHS_Ural_Open_MSV_01",
		createHashMapFromArray [
			["carAttach",   [0, -1, 1.8]],
			["heavyAttach", [0, -2, 1.6]],
			["allowHeavy", false],
			["detach",		[0, -8, 1.6]],
			["dir",         180]
		]
	],
	[
		"rhs_kamaz5350_flatbed",
		createHashMapFromArray [
			["carAttach",   [0, -1, 1.4]],
			["heavyAttach", [0, -1, 1.4]],
			["allowHeavy", false],
			["detach",		[0, -8.5, 1.4]],
			["dir",         180]
		]
	],
	[
		"UK3CB_Kraz255_Flatbed_Base",
		createHashMapFromArray [
			["carAttach",   [0, -1.7, 1.7]],
			["heavyAttach", [0, -0.6, 1.7]],
			["allowHeavy", false],
			["detach",		[0, -7, 1.7]],
			["dir",         180]
		]
	]
];

missionNamespace setVariable ["FBM_wreckCarrierConfig", _wreckCarrierConfig, true];

[
	{
		!isNil "ace_interact_menu_fnc_createAction"
		&& {!isNil "ace_interact_menu_fnc_addActionToClass"}
		&& {!isNull player}
	},
	{
		private _loadRootAction = [
			"FBM_LoadWreck",
			"Load wreck onto...",
			"",
			{ true },
			{
                    params ["_target", "_player", "_params"];
                    damage _target >= 1
                    && {_target isKindOf "LandVehicle"}
                    && {isNull (_target getVariable ["FBM_wreckCarrier", objNull])}
            },
			{
				params ["_target", "_player", "_params"];
				[_target] call FBM_fnc_addWreckCarrierActions
			}
		] call ace_interact_menu_fnc_createAction;

		["LandVehicle", 0, ["ACE_MainActions"], _loadRootAction, true] call ace_interact_menu_fnc_addActionToClass;



		private _loadWreckAction = [
			"FBM_LoadWreck",
			"Load wreck",
			"",
			{ true },
			{
				params ["_target", "_player", "_params"];
				[_target] call FBM_fnc_isValidWreckCarrier
				&& {isNull (_target getVariable ["FBM_loadedWreck", objNull])}
				&& {count ([_target] call FBM_fnc_findNearbyWrecks) > 0}
			},
			{
				params ["_target", "_player", "_params"];
				[_target] call FBM_fnc_addNearbyWreckActions
			}
		] call ace_interact_menu_fnc_createAction;

		["LandVehicle", 0, ["ACE_MainActions"], _loadWreckAction, true] call ace_interact_menu_fnc_addActionToClass;



		private _unloadAction = [
			"FBM_UnloadWreck",
			"Unload wreck",
			"",
			{
				params ["_target", "_player", "_params"];
				[_target, _player] call FBM_fnc_startUnloadWreck;
			},
			{
				params ["_target", "_player", "_params"];

				private _carrier = [_target] call FBM_fnc_getUnloadCarrier;
				!isNull _carrier
			}
		] call ace_interact_menu_fnc_createAction;

        ["LandVehicle", 0, ["ACE_MainActions"], _unloadAction, true] call ace_interact_menu_fnc_addActionToClass;
	}
] call CBA_fnc_waitUntilAndExecute;