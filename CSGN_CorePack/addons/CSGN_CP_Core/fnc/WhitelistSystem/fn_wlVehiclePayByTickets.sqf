/*
 * Author: SaintBlood8
 *
 * buy vehicles with tickets
 *
 * Usage:   [<position>,<heading>,<classname>,<ticketprice>,<payingSide>,<homeBase>,<maxDistance>] spawn CSGN_fnc_wlVehiclePayByTickets
 *           
 *          <position:Array>: position where the vehicle shall be created
 *          <heading:Number:0>: rotation of the vehicle
 *          <classname:String>: classname of the vehicle
 *          <ticketprice:Number:0>: price in tickets
 *          <payingSide:Side:West>: side which pays to get the vehicle
 *
 * Return value:
 *          True or String with error
 */
 
private["_position","_heading","_classname","_ticketprice","_payingSide","_availableTickets","_spawnPos","_error","_vehicle"];

 
_position = param [0, [], [[]],3];
_heading = param [1, 0, [0]];
_classname = param [2, "FUBAR_BAIL", [""]];
_ticketprice = param [3, 0, [0]];
_payingSide = param [3, west, [west]];
_homeBase = _this param [3, getMarkerPos format["respawn_%1",_payingSide], [[]], 3];
_maxDistance = _this param [4, 50, [1]];
_error = true;

if (count _position != 3) exitWith {_error = "position is wrong";};
if (_classname == "FUBAR_BAIL") exitWith {_error = "cnVehicle is wrong";};
if !(_ticketprice > 0) exitWith {_error = "price is wrong";};

//check if enough tickets in reserve
_availableTickets = [_payingSide,0] call BIS_fnc_respawnTickets;
if ((_ticketprice * 2) < _availableTickets) then {
    //get position to spawn object
        _spawnPos = _position findEmptyPosition [1, 10, _classname];
        if ( (count _spawnPos) != 3) exitWith {_error = "no space";};

        sleep 0.5;

    //create vehicle
        _vehicle = _classname createVehicle _spawnPos;
        _vehicle lock 2;
        _vehicle setDir _heading;
        _vehicle setPos [_spawnPos select 0,_spawnPos select 1,0.1];
        
    //take tickets away and unlock vehicle
        [_payingSide,(_ticketprice*-1)] call BIS_fnc_respawnTickets;
       
        if (_whitelistEnabled) then {
            [_vehicle,0,_payingSide,_homeBase,_maxDistance] spawn CSGN_fnc_wlVehicleInit;
        } else {
            _vehicle lock 0;
        };


} else {
    _error = "not enough money";
};

_error;