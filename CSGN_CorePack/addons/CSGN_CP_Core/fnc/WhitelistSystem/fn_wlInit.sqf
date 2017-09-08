/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle for CSGN-Vehicle-Whitelist-System
 *
 * Usage:   ONLY USE VIA MODULES - F7
 *
 * Return value:
 *          Nothing
 *
 */

_logic = _this param [0, objNull,[objNull]];
_whitelistEnabled = _logic getVariable "CSGN_SP_wlInitM_OnOff";

if !( isNil "_whitelistEnabled") then {
    missionNamespace setVariable ["CSGN_whitelistEnabled", _whitelistEnabled, true];
};