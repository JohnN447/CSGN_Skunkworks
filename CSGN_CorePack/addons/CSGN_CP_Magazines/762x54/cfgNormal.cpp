//10 Rounds
    class CSGN_CP_10Rnd_762x54_Ball: CSGN_CP_BaseMag{
        ammo = "B_762x54_Ball";
        count = 10;
        mass = 3;
        displayName = $STR_Name_CSGN_CP_10Rnd_762x54_Ball;
        descriptionShort = $STR_DescS_CSGN_CP_Ball;
        picture = "\CSGN_CP_Magazines\762x54\data\ui\normal\CSGN_CP_10Rnd_762x54_Ball.paa";
        magazineGroup[] = {"CSGN_CP_10Rnd_762x54_Group"};
        lastRoundsTracer = 3;
        initSpeed = 800;
    };
    class CSGN_CP_10Rnd_762x54_7N14: CSGN_CP_10Rnd_762x54_Ball{
        ammo = "ACE_762x54_Ball_7N14";
        displayName = $STR_Name_CSGN_CP_10Rnd_762x54_Mk262;
        descriptionShort = $STR_DescS_CSGN_CP_Mk262;
        picture = "\CSGN_CP_Magazines\762x54\data\ui\normal\CSGN_CP_10Rnd_762x54_7N14.paa";
        initSpeed = 800;
    };
    
//30 Rounds
    class CSGN_CP_30Rnd_762x54_Ball: CSGN_CP_BaseMag{
        ammo = "B_762x54_Ball";
        count = 30;
        mass = 9;
        displayName = $STR_Name_CSGN_CP_30Rnd_762x54_Ball;
        descriptionShort = $STR_DescS_CSGN_CP_Ball;
        picture = "\CSGN_CP_Magazines\762x54\data\ui\normal\CSGN_CP_30Rnd_762x54_Ball.paa";
        magazineGroup[] = {"CSGN_CP_30Rnd_762x54_Group"};
        lastRoundsTracer = 3;
        initSpeed = 800;
    };
    class CSGN_CP_30Rnd_762x54_7N14: CSGN_CP_30Rnd_762x54_Ball{
        ammo = "ACE_762x54_Ball_7N14";
        displayName = $STR_Name_CSGN_CP_30Rnd_762x54_Mk262;
        descriptionShort = $STR_DescS_CSGN_CP_Mk262;
        picture = "\CSGN_CP_Magazines\762x54\data\ui\normal\CSGN_CP_30Rnd_762x54_7N14.paa";
        initSpeed = 800;
    };

//100 Rounds
    class CSGN_CP_100Rnd_762x54_Ball: CSGN_CP_BaseMag{
        ACE_isBelt = 1;
        ammo = "B_762x54_Ball";
        count = 100;
        mass = 30;
        displayName = $STR_Name_CSGN_CP_100Rnd_762x54_Ball;
        descriptionShort = $STR_DescS_CSGN_CP_Ball;
        picture = "\CSGN_CP_Magazines\762x54\data\ui\normal\CSGN_CP_100Rnd_762x54_Ball.paa";
        magazineGroup[] = {"CSGN_CP_100Rnd_762x54_Group"};
        lastRoundsTracer = 3;
        initSpeed = 800;
    };