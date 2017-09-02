/*
 * Author: SaintBlood8
 *
 * Starts lookup if player is known to CSGN (= registered with UID in Forum)
 *
 *
 * Usage:   0 = [<unit>] call SAINT_fnc_dwiExport
 *
 *          <mode:Boolean:true>: perform a quick - and unsafe - check? checking for unlock-action for ex.
 *          <unit:Object>: who should be checked
 *
 * Return value:
 *          Array - [<isRegistered:Boolean>,<primaryUserGroup>]
 *
 */

private["_unit", "_unitUID", "_registeredPlayer", "_varName"];

_unit = _this param [1, nil,[objNull]];
if (isNil "_unit") exitWith { diag_log "wrong usage - no unit"; };
_unitUID = getPlayerUID _unit;
_registeredPlayer = nil;

//build varName
    _varName = format["CSGN_registeredPlayer_%1", _unitUID];

//if player allready has been checked we are good with that info, no need to recheck
_registeredPlayer = missionNamespace getVariable [_varName, nil];

if (isNil "_registeredPlayer") then {
    missionNamespace setVariable [_varName, nil];
    _registeredPlayer = missionNamespace getVariable [_varName, nil];

    [_unit,_varName] remoteExec ["CSGN_fnc_uniRegisteredPlayerSQL", 2, false]; 

    _counter = 0;
    while { _counter <= 10000 && isNil "_registeredPlayer"} do {
        _registeredPlayer = missionNamespace getVariable [_varName, nil];
        _counter = _counter + 1;
        sleep 0.2;
    };
};

_registeredPlayer;