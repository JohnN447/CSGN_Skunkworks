/*
 * Author: SaintBlood8
 *
 *
 * Usage:
 *
 *      ["patchVehicle", <vehicle>(,<whitelistNumber>, <crew>, <faction>, <vehicleClass>)] call CSGN_fnc_devGenConfig;
 *
 *          <vehicle:Object>: vehicle for which the configentry should be generated
 *          <whitelistNumber:Integer:0 or from CFG>: the whitelist which applies to this vehicle
 *          <crew:String:"##ReplaceWithCrew##">: classname of the (preferable CSGN) crew that should be default for this vehicle
 *          <faction:String:"##ReplaceWithCSGNFaction##">: classname of the CSGN-faction owning this vehicle
 *          <vehicleClass:String:"##ReplaceWithCSGNVehicleClass##">: classname of the CSGN-vehicleClass
 *
 * Return value:
 *          Nothing
 *
 */

if ( !(isNull (getAssignedCuratorLogic _unit)) && !(isPlayer _unit) ) exitWith {};

_curator = "ModuleCurator_F" createUnit [ position _unit, createGroup west];

_unit assignCurator _curator;

_curator setCuratorWaypointCost 0;
{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];