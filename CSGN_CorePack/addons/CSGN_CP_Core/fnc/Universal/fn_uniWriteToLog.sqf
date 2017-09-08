/*
 * Author: SaintBlood8
 *
 * Initializes Vehicle for CSGN-Vehicle-Whitelist-System
 *
 *
 * Usage:   [<logText>,<type>] spawn CSGN_fnc_uniWriteToLog;
 *              
 *          <logText:String>: text which should be logged
 *          <type:String:"Info">: type of the log - for easier searching, list below.
 *               Info
 *               Error              
 *
 * Return value:
 *          Boolean - false if failed
 */

 private["_logText", "_type", "_totalLength", "_arrayText", "_output", "_tempArray", "_tempText" ];
 
_logText = _this param [0, nil,[""]];
if (isNil "_logText") exitWith { false; };
_type = _this param [1, "Info", [""]];
if !(_type in ["Info", "Error"]) exitWith { false; };

_totalLength = count (toArray _logText);
_arrayText = toArray _logText;
_output = [];

for "_x" from 0 to _totalLength step 800 do {
    _tempArray = +_arrayText;
    _tempArray resize 800;
    _tempText = toString _tempArray;
    _arrayText deleteRange [_x, 800];

    _output append [_tempText];
};

{
    diag_log formatText['#### CSGN Log entry - type: %4 ####%1%3%1#### CSGN end of entry', toString[10], "    ", _x, _type];
} forEach _output;

true;