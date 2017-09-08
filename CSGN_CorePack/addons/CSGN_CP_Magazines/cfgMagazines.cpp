class CA_Magazine;

class CSGN_CP_BaseMag: CA_Magazine{
    ammo ="B_556x45_Ball";
    count = 30;
    displayName = "BaseMag";
    displayNameShort = "";
    descriptionShort = "Not intended to be used - not even to appear ingame, what have you done? :p";
    initSpeed = 920;
    mass = 0;
    maxLeadSpeed = 23;
    maxThrowHoldTime = 2;
    maxThrowIntensityCoef = 1.4;
    minThrowIntensityCoef = 0.3;
    model = "\A3\weapons_f\ammo\mag_univ.p3d";
    modelSpecial = "";
    nameSound = "magazine";
    picture = "";
    quickReload = 0;
    reloadAction = "";
    scope = 1;
    selectionFireAnim = "zasleh";
    simulation = "ProxyMagazines";
    type = 256;
    useAction = 0;
    useActionTitle = "";
    value = 1;
    weaponpoolavailable = 1;
    weight = 0;
    lastRoundsTracer = 0;
    tracersEvery = 0;
    magazineGroup[] = {};
};

//mass per bullet 0,2
#include "556x45\cfgNormal.cpp"
#include "556x45\cfgSpecialCase_FamasF1.cpp"
#include "556x45\cfgTracer.cpp"

#include "545x39\cfgNormal.cpp"
#include "545x39\cfgTracer.cpp"

//mass per bullet 0,3
#include "762x51\cfgNormal.cpp"
#include "762x51\cfgTracer.cpp"

#include "762x35\cfgNormal.cpp"
#include "762x35\cfgTracer.cpp"

#include "762x39\cfgNormal.cpp"
#include "762x39\cfgTracer.cpp"

#include "762x54\cfgNormal.cpp"
#include "762x54\cfgTracer.cpp"

//mass per bullet 0,6
#include "338\cfgNormal.cpp"

//mass per bullet 1,3
#include "127x99\cfgNormal.cpp"
#include "127x108\cfgNormal.cpp"

//mass per bullet 0,?
#include "9x18\cfgNormal.cpp"
#include "9x19\cfgNormal.cpp"

//mass per bullet 0,?
#include "45acp\cfgNormal.cpp"

//mass per bullet 0,?
#include "9x39\cfgNormal.cpp"
#include "9x39\cfgTracer.cpp"
