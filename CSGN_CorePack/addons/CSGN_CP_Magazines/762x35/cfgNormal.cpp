//30 Rounds
    class CSGN_CP_30Rnd_762x35_Ball: CSGN_CP_BaseMag{
        ammo = "ACE_762x35_Ball";
        count = 30;
        mass = 9;
        displayName = $STR_Name_CSGN_CP_30Rnd_762x35_Ball;
        descriptionShort = $STR_DescS_CSGN_CP_Ball;
        picture = "\CSGN_CP_Magazines\762x35\data\ui\normal\CSGN_CP_30Rnd_762x35_Ball.paa";
        magazineGroup[] = {"CSGN_CP_30Rnd_762x35_Group"};
        lastRoundsTracer = 3;
        initSpeed = 833;
    };
    class CSGN_CP_30Rnd_762x35_Subsonic: CSGN_CP_30Rnd_762x35_Ball{
        ammo = "CSGN_CP_762x35_Subsonic";
        displayName = $STR_Name_CSGN_CP_30Rnd_762x35_Subsonic;
        descriptionShort = $STR_DescS_CSGN_CP_Subsonic;
        picture = "\CSGN_CP_Magazines\762x35\data\ui\normal\CSGN_CP_30Rnd_762x35_Subsonic.paa";
        initSpeed = 325;
    };