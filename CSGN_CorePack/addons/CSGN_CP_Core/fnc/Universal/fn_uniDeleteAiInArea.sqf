/*
 * Author: SaintBlood8
 *
 * Deletes all AI-units in the area
 *
 *
 * Usage:   [<pos>,<size>, <kindOf>, <side>] spawn "CSGN_fnc_uniDeleteAiInArea";
 *              
 *          <pos:Position2D or Object>: center of position where ai will be deleted
 *          <size:Number:1000>: radius of the searched area
 *          <kindOf:Array:["Man", "landVehicle", "Ship"]>: kind of units to delete
 *          <side:Side>: side which should be removed
 *
 * Return value:
 *          nothing
 */

 private["_logic", "_hide", "_simulation"];

_pos = _this param [0,nil,[objNull,[]]];
if (isNil "_pos") exitWith { diag_log "CSGN_fnc_uniDeleteAiInArea: failed to find position"; };

_size = _this param [1,1000,[0]];
_kindOf = _this param [2,["Man", "landVehicle", "Ship"],[[]]];
_side = _this param [3, nil,[west]];
if (isNil "_side") exitWith { diag_log "CSGN_fnc_uniDeleteAiInArea: no side specified"; };

_allUnits = nearestObjects [_pos, _kindOf, _size];

{ _allUnits = _allUnits - [(vehicle _x)]; } forEach allPlayers;
{ if (side _x != _side) then { _allUnits = _allUnits - [_x]; }; } forEach _allUnits;

{
    _currentObject = _x;
    
    switch (_currentObject isKindOf "Man") do {
        case false: {
            { _currentObject deleteVehicleCrew _x } forEach crew _currentObject;
            deleteVehicle _currentObject;
        };
        case true: { deleteVehicle _currentObject; };
    };

    //to reduce desync we wait a bit
    sleep 1;
} forEach _allUnits;