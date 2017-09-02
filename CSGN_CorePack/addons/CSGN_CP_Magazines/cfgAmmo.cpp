class B_762x51_Ball;
class B_9x21_Ball;
class ACE_762x35_Ball;

class CSGN_CP_762x51_UW : B_762x51_Ball {
    typicalSpeed=270;
    thrust = 210;
    thrustTime = 1.5;
    ACE_standardAtmosphere="ASM";
    waterFriction = -0.01;
    waterEffectOffset = 0.8;
    underwaterHitRangeCoef = "1.0f";
};

class CSGN_CP_762x35_Subsonic : ACE_762x35_Ball {
    typicalSpeed=320;
};

//9x39 - i have no idea what i do <33
    class CSGN_CP_9x39_SP5 : B_9x21_Ball {
        tracerScale = 0.5;
        typicalSpeed=320;
        ACE_caliber=9;
        ACE_bulletLength=39;
        ACE_bulletMass=16.8;
        ACE_ballisticCoefficients[]={0.145};
        ACE_muzzleVelocities[]={260, 280, 295, 300};
    };
    class CSGN_CP_9x39_UW : CSGN_CP_9x39_SP5 {
        typicalSpeed=280;
        thrust = 210;
        thrustTime = 1.5;
        ACE_standardAtmosphere="ASM";
        waterFriction = -0.01;
        waterEffectOffset = 0.8;
        underwaterHitRangeCoef = "1.0f";
    };
    class CSGN_CP_9x39_SP5_Tracer_Dim : CSGN_CP_9x39_SP5 {
         nvgOnly = 1;
    };