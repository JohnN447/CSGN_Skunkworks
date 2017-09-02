/*
 * Author: SaintBlood8
 *
 * exports weapons (excluding vanilla)
 *
 * Usage:   [<query>] call CSGN_fnc_devArsenalExporter;
            copyToClipboard str(["primaryWeapon"] call CSGN_fnc_devArsenalExporter);
            debug1 = ["primaryWeapon"] call CSGN_fnc_devArsenalExporter;
 *           
 *          <query:String:"">: selection of the export to perform
 *              primaryWeapon
 *              secondaryWeapon
 *              handgunWeapon
 *              binocular
 *              optics
 *              muzzle
 *              bipod
 *              headgear
 *              uniform
 *              vest
 *
 * Return value:
 *          Text
 */

_mode = _this param [0, "",[""]];
_return = formatText['',0];
if (isNil "_return") then {_return = "";};

switch (_mode) do {
    case "primaryWeapon": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _type == 1 && _classname != "ACE_FakePrimaryWeapon") then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "secondaryWeapon": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _type == 4) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "handgunWeapon": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _type == 2) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "binocular": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _type == 4096) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "optics": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 201) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "muzzle": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 101) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "rail": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 301) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "bipod": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 302) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "headgear": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 605) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "uniform": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 801) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };
    case "vest": {
        _cfgWeapons = configFile >> "CfgWeapons";

        for "_i" from 0 to (count _cfgWeapons)-1 do {
            _currentElement = _cfgWeapons select _i;
            if (isClass _currentElement) then {
                _classname = configName _currentElement;
                _displayname = getText (_currentElement >> "displayName");
                _type = getNumber (_currentElement >> "type");
                _scope = getNumber (_currentElement >> "scope");
                _scopeArsenal = getNumber (_currentElement >> "scopeArsenal");
                _author = getText (_currentElement >> "author");
                _itemInfoType = getNumber (_currentElement >> "ItemInfo" >> "type");
                
                if ((_scope == 2 || _scopeArsenal == 2) && _itemInfoType == 701) then {
                    _entryText = formatText['%2%2"%3",%2%5%5%4%1', toString [10], "    ", _classname, _displayname, toString [47]];
                    _return = formatText["%1%2", _return, _entryText];
                };
            };
        };
    };

    default { _return = formatText["Generating export %1!","failed"]; };
};

if (_return == formatText['',0]) then { _return = formatText["Nothing to return from %1", _mode]; };

_return;