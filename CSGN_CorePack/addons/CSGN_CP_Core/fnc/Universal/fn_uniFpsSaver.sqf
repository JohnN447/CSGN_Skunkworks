/*
 * Author: SaintBlood8
 *
 * Saves FPS by disabling simulation and hides objects on clients
 *
 *
 * Usage:   [<object>, <hide>, <simulation>] call "CSGN_fnc_wlSimple";
 *              
 *          <object:Object>: gamelogic with synchronized objects
 *          <hide:Boolean:true>: hide objects/show objects
 *          <simulation:Boolean:true>: simulate objects/disable simulation for objects
 *
 * Return value:
 *          nothing
 */

 private["_logic", "_hide", "_simulation"];

_logic = _this param [0,nil,[objNull]];
if ((isNil "_logic") || !(typeOf _logic == "Logic")) exitWith { diag_log "failed to find logic-object"; };

_hide = _this param [2,true,[true]];
_simulation = _this param [3,true,[true]];

{
    _x hideObject _hide;
    _x enableSimulation _simulation;

} forEach synchronizedObjects _logic;