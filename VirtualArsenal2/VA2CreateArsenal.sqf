/*
 * Author: SaintBlood8
 *
 * Creates VA2 access to the specific VA2-Faction
 * Warning cause arma works how arma works this has to be executed after VA2Init completed - this means, in all
 * cases known to me, it can not be run in an objects init-field
 *
 * Usage:   0 = [<box>, <VA2-Faction>(, <title>, <condition>)] execVM "sc\VirtualArsenal2\VA2CreateArsenal.sqf";
 *
 *          <box:Object>: object which will recieve the VA2-action
 *          <VA2-Faction:Object>: selecting the VA2-Faction with its whitelist - refere to VA2Init for available values
                                  if not using VA2 it accepts any arsenal-object
 *          <title:String:"Virtual Arsenal">: Name of the action to display
 *          <title:String:"true">: condition to display the action - refere to condition of addAction for usage
 *
 * Return value:
 *          Nothing
 */

_box = _this param [0, nil, [objNull]];
if (isNil "_box") exitWith { diag_log "Failed to create VA2 - no box provided"; };
_VA2Faction = _this param [1, nil, [objNull]];
if (isNil "_VA2Faction") exitWith { diag_log "Failed to create VA2 - no VA2-faction provided"; };
_title = _this param [2, "Virtual Arsenal", [""]];
_condition = _this param [3, "true", [""]];

if (isServer) then {
    if (missionNamespace getVariable ["CSGN_VA2", false]) then {
        waitUntil {
            _va2InitDone = _VA2Faction getVariable ["CSGN_VA2_initDone", false];
            sleep 1;
            _va2InitDone;
        };
    };

    [_box,[_title,
        {
            //only works for player
            //["Open",[false,(_this select 3)]] spawn BIS_fnc_arsenal;

            //also works for controlled AI
            //["Open",[nil,(_this select 3),(_this select 1),((_this select 3) getVariable ["XLA_fnc_arsenal_allowEquipped",true]),((_this select 3) getVariable ["XLA_fnc_arsenal_forceReplace",[]])]] call XLA_fnc_arsenal;
            ["Open",[nil,(_this select 3),(_this select 1)]] call BIS_fnc_arsenal;
        },
        _VA2Faction,
        1000,
        true,
        true,
        "",
        _condition]
    ] remoteExec ["addAction", 0, true];
};