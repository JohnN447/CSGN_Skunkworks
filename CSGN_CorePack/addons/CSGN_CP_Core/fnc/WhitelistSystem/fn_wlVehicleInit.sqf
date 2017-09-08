/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle for CSGN-Vehicle-Whitelist-System
 *
 *
 * Usage:   [<vehicle>,<ticketprice>,<payingSide>,<homeBase>,<maxDistance>] remoteExec ["CSGN_fnc_wlVehicleInit", 0, true];
 *              
 *          <vehicle:Object>: Vehicle to initialize
 *          <ticketprice:Integer:0>: Tickets lost if the vehicle is destroyed - 0 will skip that
 *          <payingSide:Side:west>: Side which pays for the Vehicle
 *          <homeBase:Array(format Position3D):getMarkerPos format["respawn_%1",_payingSide]>: where the vehicle should be able to be locked again
 *
 * Return value:
 *          Boolean - false if failed
 *
 */

private["_vehicle","_ticketprice","_payingSide","_whitelistEnabled"];

_whitelistEnabled = missionNamespace getVariable ["CSGN_whitelistEnabled",false];

_vehicle = _this param [0, nil,[objNull]];
if (isNil "_vehicle") exitWith { false; };
_ticketprice = _this param [1, 0,[0]];
_payingSide = _this param [2, west,[west]];
_homeBase = _this param [3, getMarkerPos format["respawn_%1",_payingSide], [[]], 3];
_maxDistance = _this param [4, 50, [1]];

//check if init allready done
if ( !isNil {_vehicle getVariable ["CSGN_wlVehicleSettings",nil]}) exitWith { false; };

_vehicle setVariable["CSGN_wlVehicleSettings",[_payingSide, _ticketprice, _homeBase, _maxDistance], true];
    clearBackpackCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;

if (_ticketprice > 0) then {
    _vehicle addEventHandler ["Killed", {
        _this spawn {
            _unit = _this select 0;
            _killer = _this select 1;
            _settings = _unit getVariable "CSGN_wlVehicleSettings";
            _payingSide = _settings select 0;
            _ticketprice = _settings select 1;

            [_payingSide,(_ticketprice*-1)] call BIS_fnc_respawnTickets;
        };
    }];
};

if (_whitelistEnabled) then {
    _vehicle setVehicleLock "LOCKED";
    
    _actionNameUnlock = format ["Unlock, Vehicle costs %1 Tickets if lost", _ticketprice];
    _actionNameLock = format ["Lock Vehicle"];
    
    _conditionUnlock = format ["((locked _target) == 2) && ((side _this) == %1) && ([true, _this, _target] call CSGN_fnc_wlUidInWhitelist)", _payingSide];
    _conditionLock = format ["((locked _target) == 0) && ((side _this) == %1) && ((_this distance %2) < %3)", _payingSide, _homeBase, _maxDistance];
    
    _vehicle addAction[_actionNameUnlock, { _this spawn CSGN_fnc_wlVehicleUnlock; }, [_ticketprice, _payingSide], -100, false, false, "", _conditionUnlock];
    _vehicle addAction[_actionNameLock, { _this spawn CSGN_fnc_wlVehicleLock; }, [_ticketprice, _payingSide], -100, false, false, "", _conditionLock ];
};

true;