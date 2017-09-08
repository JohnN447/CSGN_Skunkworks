//vanilla base
    class hlc_G36_base;

class hlc_rifle_G36A1 : hlc_G36_base {
    _CSGN_isPatched = "todo: nia_magSwitch";
        magazines[] = {
            CSGN_CP_20Rnd_556x45_GroupDEF,
            CSGN_CP_30Rnd_556x45_GroupDEF
        };
    };
    
class hlc_rifle_G36C : hlc_G36_base {
    _CSGN_isPatched = "todo: nia_magSwitch";
        magazines[] = {
            CSGN_CP_20Rnd_556x45_GroupDEF,
            CSGN_CP_30Rnd_556x45_GroupDEF
        };
    };
    
class hlc_rifle_MG36 : hlc_G36_base {
    _CSGN_isPatched = "todo: nia_magSwitch";
        magazines[] = {
            CSGN_CP_20Rnd_556x45_GroupDEF,
            CSGN_CP_30Rnd_556x45_GroupDEF,
            CSGN_CP_60Rnd_556x45_GroupDEF,
            CSGN_CP_100Rnd_556x45_GroupDEF
        };
        class nia_magSwitch {
            default = "hlc_rifle_MG36";
            CSGN_CP_20Rnd_556x45_Ball = "hlc_rifle_MG36_30rnd";
            CSGN_CP_20Rnd_556x45_Ball = "hlc_rifle_MG36_30rnd";
            CSGN_CP_20Rnd_556x45_Mk262 = "hlc_rifle_MG36_30rnd";
            CSGN_CP_20Rnd_556x45_Mk318 = "hlc_rifle_MG36_30rnd";
            CSGN_CP_20Rnd_556x45_M995 = "hlc_rifle_MG36_30rnd";
            CSGN_CP_20Rnd_556x45_Ball_T = "hlc_rifle_MG36_30rnd";
            CSGN_CP_20Rnd_556x45_Ball_Tir = "hlc_rifle_MG36_30rnd";
            CSGN_CP_30Rnd_556x45_Ball = "hlc_rifle_MG36_30rnd";
            CSGN_CP_30Rnd_556x45_Mk262 = "hlc_rifle_MG36_30rnd";
            CSGN_CP_30Rnd_556x45_Mk318 = "hlc_rifle_MG36_30rnd";
            CSGN_CP_30Rnd_556x45_M995 = "hlc_rifle_MG36_30rnd";
            CSGN_CP_30Rnd_556x45_Ball_T = "hlc_rifle_MG36_30rnd";
            CSGN_CP_30Rnd_556x45_Ball_Tir = "hlc_rifle_MG36_30rnd";
        };
    };