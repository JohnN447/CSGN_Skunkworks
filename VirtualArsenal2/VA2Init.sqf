/*
 * Author: SaintBlood8
 *
 * Initializes Virtual Ammobox with sidespecific Whitelist - to be executed on server only (*caugh* initServer.sqf)
 *
 * Usage:   0 = [<camo>] execVM "sc\VirtualArsenal2\VA2Init.sqf";
 *
 *          <camo:String:"ignore">: "ignore" - ignore camouflage
 *                                  "oli" - woodland camouflage
 *                                  "tan" - desert camouflage
 *
 * Return value:
 *          Nothing
 */
 
 if !(isServer) exitWith { diag_log "silly you, you did run the VA2Init on clients!" };
 
_VA2debugMode = true;
 
_camo = _this param [0, "ignore", [""]];
missionNamespace setVariable ["CSGN_VA2", true, true];

//list of all available arsenals - each creates its own box
    {
        _current = "Land_VR_Shape_01_cube_1m_F" createVehicle [10,10,0];
        _current allowDamage false;
        switch (_VA2debugMode) do {
            case true: { ["AmmoboxInit",[_current,false,{true},format["Virtual Arsenal: %1", _x],false,[]]] spawn BIS_fnc_arsenal; };
            case false: {
                _current enableSimulationGlobal false;
                _current hideObjectGlobal true;
            };
        };
        missionNamespace setVariable [_x, _current, true];  //what the hell does this do? i should know since i wrote it... found out: sets name of the arsenal-object
    } forEach [
        "CSGN_VA2_factionGer",
        "CSGN_VA2_factionUs",
        "CSGN_VA2_factionUk",
        "CSGN_VA2_factionFre",
        "CSGN_VA2_factionGre",
        "CSGN_VA2_factionRu"
    ];

    _all = [CSGN_VA2_factionGer, CSGN_VA2_factionUs, CSGN_VA2_factionUk, CSGN_VA2_factionFre, CSGN_VA2_factionGre, CSGN_VA2_factionRu];
    
    _west = [CSGN_VA2_factionGer, CSGN_VA2_factionUs, CSGN_VA2_factionUk, CSGN_VA2_factionFre];
    _factionGer = [CSGN_VA2_factionGer];
    _factionUs = [CSGN_VA2_factionUs];
    _factionUk = [CSGN_VA2_factionUk];
    _factionFre = [CSGN_VA2_factionFre];
    
    _east = [CSGN_VA2_factionRu];
    _factionRu = [CSGN_VA2_factionRu];

    _indep = [CSGN_VA2_factionGre];
    _factionGre = [CSGN_VA2_factionGre];

//create item-arrays
    _vaweapons = [];
    _vaammo = [];
    _vaitems = [];
    _vabackpacks = [];

//whitelists of all mods
    #include "whitelistBIS.sqf"                             //Vanilla Arma
    #include "whitelistACE3.sqf"                            //@ace
    #include "whitelistTFAR.sqf"                            //@task_force_radio

    #include "whitelistCSGN_CP_CorePack_Magazines.sqf"      //@CSGN_CorePack

    #include "whitelistBWA3.sqf"                            //@BWMod
    #include "whitelistNIARMSG36.sqf"                       //@NIArms G36 Rifles
    #include "whitelistNIARMSMG3.sqf"                       //@NIArms MG3 GPMGs
    #include "whitelistPBW.sqf"                             //@Bundeswehr Kleiderkammer (PBW)

//processing assets for whitelisting
    {
        _item = _x select 0;
        _itemCamo = _x select 1;
        _whitelists = _x select 2;

        switch (isNil "_itemCamo") do {
            case true: {
                {
                    _value = (_x getVariable ["CSGN_VA2_weaponsArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_weaponsArray", _value, false];
                } forEach _whitelists; };
            case false: { if ((_camo == "ignore") || (_itemCamo == _camo)) then {
                {
                    _value = (_x getVariable ["CSGN_VA2_weaponsArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_weaponsArray", _value, false];
                } forEach _whitelists; }; };
        };
    } forEach _vaweapons;
    
    {
        _item = _x select 0;
        _itemCamo = _x select 1;
        _whitelists = _x select 2;

        switch (isNil "_itemCamo") do {
            case true: {
                {
                    _value = (_x getVariable ["CSGN_VA2_ammoArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_ammoArray", _value, false];
                } forEach _whitelists; };
            case false: { if ((_camo == "ignore") || (_itemCamo == _camo)) then {
                {
                    _value = (_x getVariable ["CSGN_VA2_ammoArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_ammoArray", _value, false];
                } forEach _whitelists; }; };
        };
    } forEach _vaammo;
    
    {
        _item = _x select 0;
        _itemCamo = _x select 1;
        _whitelists = _x select 2;

        switch (isNil "_itemCamo") do {
            case true: {
                {
                    _value = (_x getVariable ["CSGN_VA2_itemArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_itemArray", _value, false];
                } forEach _whitelists; };
            case false: { if ((_camo == "ignore") || (_itemCamo == _camo)) then {
                {
                    _value = (_x getVariable ["CSGN_VA2_itemArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_itemArray", _value, false];
                } forEach _whitelists; }; };
        };
    } forEach _vaitems;
    
    {
        _item = _x select 0;
        _itemCamo = _x select 1;
        _whitelists = _x select 2;

        switch (isNil "_itemCamo") do {
            case true: {
                {
                    _value = (_x getVariable ["CSGN_VA2_backpackArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_backpackArray", _value, false];
                } forEach _whitelists; };
            case false: { if ((_camo == "ignore") || (_itemCamo == _camo)) then {
                {
                    _value = (_x getVariable ["CSGN_VA2_backpackArray", [] ]);
                    _value pushBackUnique _item;
                    _x setVariable ["CSGN_VA2_backpackArray", _value, false];
                } forEach _whitelists; }; };
        };
    } forEach _vabackpacks;

//adding items according to preprocessed lists
/*reason to do it this way: adding items one by one might skip some items while processing (spawn)
                            or might take decades (call) */
    {
        [_x] spawn {
            _curBox = _this select 0;
            [_curBox, (_curBox getVariable ["CSGN_VA2_weaponsArray", [] ]), true, false] call BIS_fnc_addVirtualWeaponCargo;
            [_curBox, (_curBox getVariable ["CSGN_VA2_ammoArray", [] ]), true, false] call BIS_fnc_addVirtualMagazineCargo;
            [_curBox, (_curBox getVariable ["CSGN_VA2_itemArray", [] ]), true, false] call BIS_fnc_addVirtualItemCargo;
            [_curBox, (_curBox getVariable ["CSGN_VA2_backpackArray", [] ]), true, false] call BIS_fnc_addVirtualBackpackCargo;
            
            _curBox setVariable ["CSGN_VA2_initDone", true, false];
        };
    } forEach _all;
 
if (_VA2debugMode) then { diag_log "VA2 init is done"; };