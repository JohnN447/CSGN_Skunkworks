/*
 * Author: SaintBlood8
 *
 *
 * Usage:
 *
 *  Hide Generators
 *      ["hideVehicle", <vehicle>] call CSGN_fnc_devGenConfig;
 *
 *          <vehicle:Object>: vehicle for which the configentry should be generated
 *
 *
 *      ["hideUnit", <unit>] call CSGN_fnc_devGenConfig;
 *
 *          <unit:Object>: unit for which the configentry should be generated
 *
 *
 *
 *  Patch Generators
 *      ["patchVehicle", <vehicle>(,<whitelistNumber>, <crew>, <faction>, <vehicleClass>)] call CSGN_fnc_devGenConfig;
 *
 *          <vehicle:Object>: vehicle for which the configentry should be generated
 *          <whitelistNumber:Integer:0 or from CFG>: the whitelist which applies to this vehicle
 *               lightVehicles........1     rotaryTransport......6
 *               lightTanks...........2     fixedwingAttack......7
 *               heavyTanks...........3     fixedwingTransport...8
 *               Artillery............4     UAV..................9
 *               rotaryAttack.........5
 *          <crew:String:"##ReplaceWithCrew##">: classname of the (preferable CSGN) crew that should be default for this vehicle
 *          <faction:String:"##ReplaceWithCSGNFaction##">: classname of the CSGN-faction owning this vehicle
 *          <vehicleClass:String:"##ReplaceWithCSGNVehicleClass##">: classname of the CSGN-vehicleClass
 *
 * Return value:
 *          String
 *
 */
 
private["_mode"];

_mode = _this param [0, "bail",[""]];
if (_mode == "bail") exitWith { "ERROR: no mode selected!"; };
 
_return = "ERROR: nothing to return";

switch (_mode) do {
    case "hideWeapon": {
        _unit = _this param [1, nil,[objNull]];
        if (isNil "_unit") exitWith { _return = "ERROR: no unit provided"; };
    
        _classname = currentWeapon _unit;
        if (isNil "_classname") exitWith { _return = "ERROR: no weapon detected"; };
        _inheritsFromArray = (str (inheritsFrom (configfile >> "cfgWeapons" >> _classname )) splitString "/");
        _inheritsFromClassname = (_inheritsFromArray select ( (count _inheritsFromArray)-1));
        
        _return = format["class %1 : %2 { scope=1; };",_classname, _inheritsFromClassname];
    };

    case "hideVehicle": {
        _vehicle = _this param [1, nil,[objNull]];
        if (isNil "_vehicle") exitWith { _return = "ERROR: no vehicle provided"; };
    
        _classname = typeOf _vehicle;
        _inheritsFromArray = (str (inheritsFrom (configfile >> "cfgVehicles" >> _classname )) splitString "/");
        _inheritsFromClassname = (_inheritsFromArray select ( (count _inheritsFromArray)-1));
        
        _return = format["class %1 : %2 { scope=1; };",_classname, _inheritsFromClassname];
    };
    
    case "hideUnit": {
        _unit = _this param [1, nil,[objNull]];
        if (isNil "_unit") exitWith { _return = "ERROR: no unit provided"; };
    
        _classname = typeOf _unit;
        _inheritsFromArray = (str (inheritsFrom (configfile >> "cfgVehicles" >> _classname )) splitString "/");
        _inheritsFromClassname = (_inheritsFromArray select ( (count _inheritsFromArray)-1));
        
        _return = format["class %1 : %2 { scope=1; };",_classname, _inheritsFromClassname];
    };
  
    case "patchVehicle": {
        _vehicle = _this param [1, nil,[objNull]];
        if (isNil "_vehicle") exitWith { _return = "ERROR: no vehicle provided"; };
        _whitelistNumber = _this param [2, (getNumber (configfile >> "CfgVehicles" >> typeof _vehicle >> "CSGN_requiredWhitelist")),[0]];
        _crew = _this param [3, "##ReplaceWithCrew##",[""]];
        _faction = _this param [4, "##ReplaceWithCSGNFaction##",[""]];
        _vehicleClass = _this param [5, "##ReplaceWithCSGNVehicleClass##",[""]];
        
        if !((_whitelistNumber != 0) && ((_whitelistNumber == -1) || ((_whitelistNumber >=1) && (_whitelistNumber <= 9)))) exitWith { _return = "ERROR: whitelist unknown"; };
        
        _classname = typeOf _vehicle;
        _inheritsFromArray = (str (inheritsFrom (configfile >> "cfgVehicles" >> _classname )) splitString "/");
        _inheritsFromClassname = (_inheritsFromArray select ( (count _inheritsFromArray)-1));
        
        _return = format['class %3 : %4 {%1%2scope=2;%1%1%2CSGN_requiredWhitelist=%5;%1%1%2faction = "%6";%1%2vehicleClass = "%7";%1%2crew = "%8";%1};',
            toString [10], //%1
            "    ", //%2
            _classname, //%3
            _inheritsFromClassname, //%4
            _whitelistNumber, //%5
            _faction, //%6
            _vehicleClass, //%7
            _crew //%8
        ];
    };
    

    case "createUnitFromUnit": {
        _unit = _this param [1, player,[objNull]];
        _newUnitClassname = _this param [2, "##replaceWithClassname##",[""]];
        _newUnitBaseClass = _this param [3, "##replaceWithBaseClass##",[""]];
        _uniformClass = getText (configfile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass");
        _model = getText (configfile >> "CfgVehicles" >> _uniformClass >> "model");
        _modelSides = getArray (configfile >> "CfgVehicles" >> _uniformClass >> "modelSides");
        _nakedUniform = getText (configfile >> "CfgVehicles" >> _uniformClass >> "nakedUniform");;
        _hiddenSelectionTextures = getArray (configfile >> "CfgVehicles" >> _uniformClass >> "hiddenSelectionsTextures");
        _hiddenSelectionTexturesArraySize = (count _hiddenSelectionTextures)-1;
        _cost = _this param [4, getNumber (configfile >> "CfgVehicles" >> typeof _unit >> "cost"),[0]];;
        _backpack = _this param [5, backpack _unit,[""]];
        _vest = vest _unit;
        _headgear = headgear _unit;
        _items = (items _unit) joinstring ", ";
        _primaryWeapon = _this param [6, primaryWeapon _unit,[""]];
        _handgunWeapon = _this param [7, handgunWeapon _unit,[""]];
        _secondaryWeapon = _this param [8, secondaryWeapon _unit,[""]];
        _magazines = (magazines _unit) joinstring ", ";
        _linkedItems = "";
        _weapons = "";
        _hiddenSelectionTexturesString = "";

        for "_i" from 0 to _hiddenSelectionTexturesArraySize do {
            if (_i == _hiddenSelectionTexturesArraySize) then {
                _hiddenSelectionTexturesString = format['%4%2%2%"%3"', toString [10], "    ", _hiddenSelectionTextures select _i, _hiddenSelectionTexturesString];
            } else {
                _hiddenSelectionTexturesString = format['%4%2%2%"%3",%1', toString [10], "    ", _hiddenSelectionTextures select _i, _hiddenSelectionTexturesString];
            };
        };
        
        if (_backpack != "") then { _backpack = format['%2backpack = "%3"', toString [10], "    ", _backpack]; } else { _backpack = ""; };
        if (_vest != "") then { _linkedItems = format['%2%2%3', toString [10], "    ", _vest]; };
        if (_headgear != "") then {
            if (_vest != "") then {
                _linkedItems = format['%4,%1%2%2%3', toString [10], "    ", _headgear, _linkedItems];
            } else {
                _linkedItems = format['%2%2%3', toString [10], "    ", _headgear];
            };
        };
        if (count (assignedItems _unit)!=0) then {
            if ((_headgear != "") || (_vest != "")) then {
                _linkedItems = format['%4,%1%2%2%3', toString [10], "    ", (assignedItems _unit) joinstring ", ", _linkedItems];
            } else {
                _linkedItems = (assignedItems _unit) joinstring ", ";
            };
        };
        
        if (_primaryWeapon != "") then { _weapons = format['%2%2%3,%1', toString [10], "    ", _primaryWeapon]; };
        if (_handgunWeapon != "") then { _weapons = format['%4%2%2%3,%1', toString [10], "    ", _handgunWeapon, _weapons]; };
        if (_secondaryWeapon != "") then { _weapons = format['%4%2%2%3,%1', toString [10], "    ", _secondaryWeapon, _weapons]; };

        _return = format['class %3 : %4 {%1%2scope = 2;%1%1%2model = "%5";%1%2modelSides[] = {%6};%1%2uniformClass = "%7";%1%2nakedUniform = "%8";%1%2hiddenSelectionsTextures[] = {%1%9%1%2};%1%1%2_generalMacro = "%3";%1%2displayName = $STR_%3;%1%2cost = %10;%1%1%2linkedItems[] = {%1%12%1%2};%1%2respawnLinkedItems[] = {%1%12%1%2};%1%1%2Items[] = {%1%2%2%13%1%2};%1%2RespawnItems[] = {%1%2%2%13%1%2};%1%1%2weapons[] = {%1%14%2%2Throw, Put%1%2};%1%2respawnWeapons[] = {%1%14%2%2Throw, Put%1%2};%1%1%2magazines[] = {%1%2%2%15%1%2};%1%2respawnMagazines[] = {%1%2%2%15%1%2};%1};',
            toString [10], //%1
            "    ", //%2
            _newUnitClassname, //%3
            _newUnitBaseClass, //%4
            _model, //%5
            _modelSides joinstring ",", //%6
            _uniformClass, //%7
            _nakedUniform, //%8
            _hiddenSelectionTexturesString, //%9
            _cost, //%10
            _backpack, //%11
            _linkedItems, //%12
            _items, //%13
            _weapons, //%14
            _magazines //%15
        ];
    };
};

_return;