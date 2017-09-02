/*
 * Author: SaintBlood8
 *
 * Starts lookup if player is known to CSGN (= registered with UID in Forum)
 *
 *
 * Usage:   0 = [<unit>,<insigniaGroup] spawn CSGN_fnc_uniSetStaffInsignia;
 *
 *          <unit:Object>: who should recieve an insignia
 *          <insigniaGroup:String>: what group-insignia should be applied
 *
 * Return value:
 *          Boolean - false if no insignia was given to unit
 *
 */

private["_unit", "_insigniaGroup", "_registeredPlayer", "_varName"];

_unit = _this param [0, nil,[objNull]];
if (isNil "_unit") exitWith { diag_log "wrong usage - no unit"; };
_insigniaGroup = _this param [1, "",[""]];

switch (_insigniaGroup) do {
    case "": { _insignia = ""; };
    case "Admin": { _insignia = "CSGN_insigniaAdmin"; };
};

if (!(isNil "_unit") && (_insignia != "")) then { _return = [_unit,_insignia] call BIS_fnc_setUnitInsignia; };
_return;