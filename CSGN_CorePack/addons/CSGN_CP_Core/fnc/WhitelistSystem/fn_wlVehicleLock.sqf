/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle for CSGN-Vehicle-Whitelist-System
 *
 *
 * Usage:   0 = [<vehicle>,<ticketprice>,<payingSide>] spawn CSGN_fnc_wlVehicleInit;
 *
 *          <vehicle:Object>: Vehicle to initialize
 *          <ticketprice:Integer:0>: Tickets lost if the vehicle is destroyed - 0 will skip that
 *          <payingSide:Side:west>: Side which pays for the Vehicle
 *
 * Return value:
 *          Boolean - false if failed
 *
 */

 private["_vehicle","_caller","_ticketprice","_payingSide","_vehicle","_infoText"];

_vehicle = _this select 0;
_caller = _this select 1;
_ticketprice = (_this select 3) select 0;
_payingSide = (_this select 3) select 1;

{
     moveOut _x; 
} forEach crew _vehicle;

_vehicle setVehicleLock "LOCKED";

