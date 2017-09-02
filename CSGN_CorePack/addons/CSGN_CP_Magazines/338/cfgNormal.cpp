//5 Rounds
    class CSGN_CP_5Rnd_338_Ball: CSGN_CP_BaseMag{
        ammo = "ACE_338_Ball";
        count = 7;
        mass = 3;
        displayName = $STR_Name_CSGN_CP_5Rnd_338_Ball;
        descriptionShort = $STR_DescS_CSGN_CP_Ball;
        picture = "\CSGN_CP_Magazines\338\data\ui\normal\CSGN_CP_5Rnd_338_Ball.paa";
        magazineGroup[] = {"CSGN_CP_5Rnd_338_Group"};
        lastRoundsTracer = 0;
        initSpeed = 800;
    };

    class CSGN_CP_5Rnd_338_API: CSGN_CP_5Rnd_338_Ball{
        ammo = "ACE_338_Ball_API526";
        displayName = $STR_Name_CSGN_CP_5Rnd_338_API;
        descriptionShort = $STR_DescS_CSGN_CP_API;
        picture = "\CSGN_CP_Magazines\338\data\ui\normal\CSGN_CP_5Rnd_338_API.paa";
        initSpeed = 800;
    };