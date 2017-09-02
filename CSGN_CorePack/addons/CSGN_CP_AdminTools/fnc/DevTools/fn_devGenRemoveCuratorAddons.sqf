/*
 * Author: SaintBlood8
 *
 *
 * Usage: [] call CSGN_fnc_devGenConfig;
 *
 *        <vehicle:Object>: vehicle for which the configentry should be generated
 *
 * Return value:
 *          Array of Addons
 *
 */
 
private["_mode"];

_curator = getAssignedCuratorLogic player;

{ publicVariable "CSGN_initRemovedCuratorAddons";} remoteExec ["bis_fnc_call", 2]; 

for "_i" from 1 to 1000 do {
    if !(isNil {missionNamespace getVariable ["CSGN_initRemovedCuratorAddons",nil]}) then { _i = 1001;};
};

_initRemovedCuratorAddons = missionNamespace getVariable ["CSGN_initRemovedCuratorAddons",[]];

_newArray = [];
_newArray append _initRemovedCuratorAddons;

{
    _currentUnitAddon = unitAddons (typeof _x);
    _newArray = (_newArray - [_currentUnitAddon]) + [_currentUnitAddon];
} forEach (curatorEditableObjects _curator);

_newArray;