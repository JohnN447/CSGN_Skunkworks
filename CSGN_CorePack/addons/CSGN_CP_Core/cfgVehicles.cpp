class Logic;

class Module_F: Logic {
    class ModuleDescription;
};

class CSGN_CP_wlInitM: Module_F {
    scope = 2;
    displayName = $STR_CSGN_CP_wlInitM;
    //icon = "\myTag_addonName\data\iconNuke_ca.paa";
    category = "NO_CATEGORY";

    function = "CSGN_fnc_wlInit";
    functionPriority = 1;
    isGlobal = 0;
    isTriggerActivated = 0;
    isDisposable = 0;

    curatorInfoType = "";

    class Arguments {
        class CSGN_CP_wlInitM_OnOff {
            displayName = $STR_CSGN_CP_wlInitM_OnOff_Name;
            description = $STR_CSGN_CP_wlInitM_OnOff_Description;
            typeName = "BOOL";
            defaultValue = 0;
        };
    };

    class ModuleDescription: ModuleDescription {
        description = "Short module description";
    };
};