/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle or Ammobox and fills it with cargo defined in CSGN_cargoMagazines,
 * CSGN_cargoWeapons, CSGN_cargoItems and CSGN_cargoBackpacks.
 * 
 * TODO: handle curator spawning of vehicles - they have cargo which needs to be removed - maybe switch over to a check if csgn_cargoinit has been done
 * TODO: everything, this is work in progress
 *
 * Usage:   [<object>] spawn CSGN_fnc_uniCargoInit;
 *              
 *          <object:OBJECT>: unit to be supplied with cargo fetched from config
 *
 * Return value:
 *          nothing
 */

_unit = _this param [0, nil,[objNull]];
if (isNil "_unit") exitWith { diag_log "wrong usage - no unit"; }; //todo: custom log message

//if vehicle has cargo we stop right here.. not that we break something done by missionmakers
if (
    ((count ((getItemCargo _unit) select 0))!=0) || 
    ((count ((getWeaponCargo _unit) select 0))!=0) || 
    ((count ((getMagazineCargo _unit) select 0))!=0) || 
    ((count ((getBackpackCargo _unit) select 0))!=0)
) exitWith{};

//if for some reason we dont get an array thats even we do nothing, cause obviously someone sucks at doing configs :P
//items and amount however will not be checked to speed things up a little
_itemCargo = (configfile >> "CfgVehicles" >> typeof _unit >> "CSGN_cargoItems") call BIS_fnc_getCfgDataArray;
if (((count _itemCargo) >= 2) && ((count _itemCargo)%2 == 0)) then{
    for "_i" from 0 to (count _itemCargo)-1 step 2 do {
        _unit addItemCargoGlobal [(_itemCargo select _i), (_itemCargo select (_i+1))]
    };
};

_magazineCargo = (configfile >> "CfgVehicles" >> typeof _unit >> "CSGN_cargoMagazines") call BIS_fnc_getCfgDataArray;
if (((count _magazineCargo) >= 2) && ((count _magazineCargo)%2 == 0)) then{
    for "_i" from 0 to (count _magazineCargo)-1 step 2 do {
        _unit addMagazineCargoGlobal [(_magazineCargo select _i), (_magazineCargo select (_i+1))]
    };
};

_backpackCargo = (configfile >> "CfgVehicles" >> typeof _unit >> "CSGN_cargoBackpacks") call BIS_fnc_getCfgDataArray;
if (((count _backpackCargo) >= 2) && ((count _backpackCargo)%2 == 0)) then{
    for "_i" from 0 to (count _backpackCargo)-1 step 2 do {
        _unit addBackpackCargoGlobal [(_backpackCargo select _i), (_backpackCargo select (_i+1))]
    };
};

_weaponCargo = (configfile >> "CfgVehicles" >> typeof _unit >> "CSGN_cargoWeapons") call BIS_fnc_getCfgDataArray;
if (((count _weaponCargo) >= 2) && ((count _weaponCargo)%2 == 0)) then{
    for "_i" from 0 to (count _weaponCargo)-1 step 2 do {
        _unit addWeaponCargoGlobal [(_weaponCargo select _i), (_weaponCargo select (_i+1))]
    };
};