/*
 * Whitelists:
 * -1 = none required
 * 1 = light vehicles (ex. Hunter, Hemett, Strider)
 * 2 = light tanks (ex. Cheetah, Marid, Bobcat)
 * 3 = heavy tanks (ex. Slammer, Varsuk, Kuma)
 * 4 = artillery (ex. Scorcher)
 * 5 = rotary attack (ex. Blackfoot, Kajman)
 * 6 = rotary transport (ex. Mohawk, Ghosthawk)
 * 7 = fixed wing attack (ex. Wipeout)
 * 8 = fixed wing transport (ex. C130)
 */
 
//Man
#include "cfgVehiclesMan.cpp"


//cars
    class BWA3_Eagle_hatch_base;
    class BWA3_Eagle_flw100_base;
    
    class BWA3_Eagle_Fleck : BWA3_Eagle_hatch_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
        CSGN_cargoItems[] = {};
        CSGN_cargoMagazines[] = {"CSGN_CP_30Rnd_9x39_UW",6,"CSGN_CP_13Rnd_45ACP_Ball",1000};
        CSGN_cargoWeapons[] = {};
        CSGN_cargoBackpacks[] = {};
        
        class Eventhandlers : Eventhandlers {
            init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;}; [(_this select 0)] remoteExec [""CSGN_fnc_uniCargoInit"", _this, false];";
        };
    };
    
    class BWA3_Eagle_FLW100_Fleck : BWA3_Eagle_flw100_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Eagle_Tropen : BWA3_Eagle_hatch_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };
    
    class BWA3_Eagle_FLW100_Tropen : BWA3_Eagle_flw100_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

//rotary
    class BWA3_Tiger_base;
    class BWA3_Tiger_RMK_base;
    
    class BWA3_Tiger_Gunpod_FZ : BWA3_Tiger_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };
    
    class BWA3_Tiger_Gunpod_PARS : BWA3_Tiger_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };
    
    class BWA3_Tiger_Gunpod_Heavy : BWA3_Tiger_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Tiger_RMK_FZ : BWA3_Tiger_RMK_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Tiger_RMK_PARS : BWA3_Tiger_RMK_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Tiger_RMK_Heavy : BWA3_Tiger_RMK_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Tiger_RMK_Universal : BWA3_Tiger_RMK_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

//armored
    class BWA3_Leopard_base;
    
    class BWA3_Leopard2A6M_Fleck : BWA3_Leopard_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Leopard2A6M_Tropen : BWA3_Leopard_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };
    
//armored transport
    class BWA3_Puma_base;
    
    class BWA3_Puma_Fleck : BWA3_Puma_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };

    class BWA3_Puma_Tropen : BWA3_Puma_base {
        _CSGN_isPatched = "??? profit";
        faction = "CSGN_CP_WE_GER";
    };



//boxes
#include "cfgVehiclesBoxes.cpp"













