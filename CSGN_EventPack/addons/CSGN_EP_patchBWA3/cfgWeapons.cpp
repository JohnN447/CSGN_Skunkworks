//vanilla base
    class Pistol_Base_F;
    class Rifle_Base_F;
    class Rifle_Long_Base_F;

//9x19
    class BWA3_P8 : Pistol_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_15Rnd_9x19_GroupDEF
        };
    };

//556x45
    class BWA3_G36 : Rifle_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_20Rnd_556x45_GroupDEF,
            CSGN_CP_30Rnd_556x45_GroupDEF
        };
    };
    
    class BWA3_G38 : Rifle_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_20Rnd_556x45_GroupDEF,
            CSGN_CP_30Rnd_556x45_GroupDEF
        };
    };

    class BWA3_G36_LMG : BWA3_G36 {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_20Rnd_556x45_GroupDEF,
            CSGN_CP_30Rnd_556x45_GroupDEF,
            CSGN_CP_60Rnd_556x45_GroupDEF,
            CSGN_CP_100Rnd_556x45_GroupDEF
        };
    };

    class BWA3_MG4 : Rifle_long_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_100Rnd_556x45_GroupDEF,
            CSGN_CP_200Rnd_556x45_GroupDEF
        };
    };
    
//762x51
    class BWA3_G28_Standard : Rifle_long_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_10Rnd_762x51_GroupDEF,
            CSGN_CP_20Rnd_762x51_GroupDEF
        };
    };

    class BWA3_G28_Assault : BWA3_G28_Standard {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_10Rnd_762x51_GroupDEF,
            CSGN_CP_20Rnd_762x51_GroupDEF
        };
    };

    class BWA3_G27 : BWA3_G28_Standard {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_10Rnd_762x51_GroupDEF,
            CSGN_CP_20Rnd_762x51_GroupDEF
        };
    };

    class BWA3_MG5 : Rifle_long_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_75Rnd_762x51_GroupDEF,
            CSGN_CP_100Rnd_762x51_GroupDEF,
            CSGN_CP_120Rnd_762x51_GroupDEF,
            CSGN_CP_150Rnd_762x51_GroupDEF
        };
    };

//127x99
    class BWA3_G82 : Rifle_long_Base_F {
        _CSGN_isPatched = "??? profit";
        magazines[] = {
            CSGN_CP_10Rnd_127x99_GroupDEF
        };
    };