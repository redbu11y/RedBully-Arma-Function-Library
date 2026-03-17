params ["_wreck"];

if (_wreck isKindOf "Tank") exitWith {"heavy"};
if (_wreck isKindOf "Wheeled_APC_F") exitWith {"heavy"};
"car"