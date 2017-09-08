/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle for CSGN-Vehicle-Whitelist-System
 *
 *
 * Usage:   0 = [<mode>,<unit>,<vehicle>] call SAINT_fnc_dwiExport
 *
 *          <mode:Boolean:true>: perform a quick - and unsafe - check? checking for unlock-action for ex.
 *          <unit:Object>: who should be checked
 *
 * Return value:
 *          Boolean - false if failed
 *
 */
 //missionNamespace getVariable "CSGN_whitelistsofplayer_76561197985800675"
private["_whitelistEnabled"];

_whitelistEnabled = missionNamespace getVariable ["CSGN_whitelistEnabled",false];

if !(_whitelistEnabled) exitWith { true; };

_mode = _this param [0, true,[true]];
_unit = _this param [1, nil,[objNull]];
if (isNil "_unit") exitWith { false; };
_vehicle = _this param [2, nil,[objNull]];
if (isNil "_vehicle") exitWith { false; };
_unitUID = getPlayerUID _unit;
_requiredWhitelist = nil;

//build varName
    _varName = format["CSGN_whitelistsOfPlayer_%1", _unitUID];

//read whitelists of the player for quickcheck
    _whitelistsOfPlayer = missionNamespace getVariable [_varName, nil];

//get the required whitelist
    switch ( isNumber (configfile >> "CfgVehicles" >> typeof _vehicle >> "CSGN_requiredWhitelist") ) do {
        case true: { _requiredWhitelist = getNumber (configfile >> "CfgVehicles" >> typeof _vehicle >> "CSGN_requiredWhitelist"); };
        case false: { _requiredWhitelist = 0;
            //todo send fancy warning to serverlog about undefined vehicle
        };
    };

//bail out since no whitelist is required or ever will be
if (_requiredWhitelist == -1) exitWith { true; };

if (!(_mode) || (isNil "_whitelistsOfPlayer")) then {
    missionNamespace setVariable [_varName, nil];
    _whitelistsOfPlayer = missionNamespace getVariable [_varName, nil];

    [_unit,_varName] remoteExec ["CSGN_fnc_wlQuerySQL", 2, false]; 

    _counter = 0;
    while { _counter <= 10000 && isNil "_whitelistsOfPlayer" && alive _vehicle && alive _unit } do {
        _whitelistsOfPlayer = missionNamespace getVariable [_varName, nil];
        _counter = _counter + 1;
        sleep 0.2;
    };
};

if (!(isNil "_whitelistsOfPlayer") && (typename (_whitelistsOfPlayer select _requiredWhitelist) == "BOOL")) exitWith {
    (_whitelistsOfPlayer select _requiredWhitelist);
};

false;