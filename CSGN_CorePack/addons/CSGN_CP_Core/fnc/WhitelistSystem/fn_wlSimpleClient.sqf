/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle for CSGN-Vehicle-Whitelist-System
 *
 *
 * Usage:   [<vehicle>] remoteExec ["CSGN_fnc_wlVehicleInit", 0, true];
 *              
 *          <vehicle:Object>: Vehicle to initialize
 *
 * Return value:
 *          Boolean - false if failed
 *
 * todo: handle ai correctly
 *       { if !(isPlayer _x) then { unassignVehicle _x}; } forEach allunits;
 *
 */
 
_whitelistEnabled = missionNamespace getVariable ["CSGN_whitelistEnabled",false];
 
_vehicle = _this param [0, nil,[objNull]];
if (isNil "_vehicle") exitWith { false; };

if (_whitelistEnabled) then {
    //getIn
    _vehicle addEventHandler ["GetIn", {
        _this spawn {
            _vehicle = _this select 0;
            _position = _this select 1;
            _unit = _this select 2;
            _turret = _this select 3;
            
            if !(local _unit) exitWith {};
            
            _newRole = assignedVehicleRole _unit;
            
            if (_newRole select 0 == "Cargo") exitWith {};
            
            if !(isPlayer _unit) exitWith { moveOut _unit; };

            _varName = format["CSGN_whitelistsOfPlayer_%1", getPlayerUID _unit];

            _isWhitelisted = [false, _unit, _vehicle] call CSGN_fnc_wlUidInWhitelist;
            
            switch ( _isWhitelisted ) do {
                case true: {};
                case false: { moveOut _unit;
                        _infoText = format["You, %1:%2,\nare not on the Whitelist for that Vehicle!", name _unit, getPlayerUID _unit];
                        _infoText remoteExec ["hint", _unit, false];
                };
            };
        };
    }];

    //seatSwitched
    _vehicle addEventHandler ["SeatSwitched", {
        _this spawn {
            _vehicle = _this select 0;
            _units = [_this select 1, _this select 2];

            {
                if !(local _x) exitWith {};
                
                _newRole = assignedVehicleRole _x;
                
                if (_newRole select 0 == "Cargo") exitWith {};
                
                if !(isPlayer _x) exitWith { moveOut _x; };

                _varName = format["CSGN_whitelistsOfPlayer_%1", getPlayerUID _x];

                _isWhitelisted = [false, _x, _vehicle] call CSGN_fnc_wlUidInWhitelist;
                
                switch ( _isWhitelisted ) do {
                    case true: {};
                    case false: { moveOut _x;
                        _infoText = format["You, %1:%2,\nare not on the Whitelist for that Vehicle!", name _x, getPlayerUID _x];
                        _infoText remoteExec ["hint", _x, false];
                    };
                };
            } forEach _units;
        };
    }];
};