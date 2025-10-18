#include <amxmodx>
#include <reapi>

// Uncomment this if you have the money_ul
// #define USE_MONEY_UL

#if defined USE_MONEY_UL
    #include <money_ul>
#else
    #include <cstrike>
#endif

#define PLUGIN "[CSDM] Knife Stealer"
#define VERSION "1.0"
#define AUTHOR "DadoDz"

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    RegisterHookChain(RG_CBasePlayer_Killed, "OnPlayerKilled", true);
}

public OnPlayerKilled(const victim, const killer, const shouldgib)
{
    if (!is_user_connected(killer) || killer == victim)
        return;

    new iActiveItem = get_member(killer, m_pActiveItem);
    if (!is_entity(iActiveItem))
        return;

    new szWeaponName[32];
    get_entvar(iActiveItem, var_classname, szWeaponName, charsmax(szWeaponName));

    if (!equal(szWeaponName, "weapon_knife") && !equal(szWeaponName, "knife"))
        return;

    new headshot = get_member(victim, m_bHeadshotKilled);
    new chance = random_num(1, 100);
    new VictimMoney, KillerMoney;
    new szVictimName[32], szKillerName[32];

#if defined USE_MONEY_UL
    VictimMoney = cs_get_user_money_ul(victim);
    KillerMoney = cs_get_user_money_ul(killer);
#else
    VictimMoney = cs_get_user_money(victim);
    KillerMoney = cs_get_user_money(killer);
#endif

    get_user_name(victim, szVictimName, charsmax(szVictimName));
    get_user_name(killer, szKillerName, charsmax(szKillerName));

    switch (chance)
    {
        case 1..75:
        {
            if (headshot)
            {
                if (VictimMoney >= 2500)
                {
                    VictimMoney -= 2500;
                    KillerMoney += 2500;
                    client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was robbed of^x03 2500$^x01 by^x03 %s^x01!", szVictimName, szKillerName);
                }
                else
                {
                    KillerMoney += VictimMoney;
                    VictimMoney = 0;
                    client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was robbed of^x03 %d$^x01 by^x03 %s^x01!", szVictimName, VictimMoney, szKillerName);
                }
            }
            else
            {
                if (VictimMoney >= 1250)
                {
                    VictimMoney -= 1250;
                    KillerMoney += 1250;
                    client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was robbed of^x03 1250$^x01 by^x03 %s^x01!", szVictimName, szKillerName);
                }
                else
                {
                    KillerMoney += VictimMoney;
                    VictimMoney = 0;
                    client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was robbed of^x03 %d$^x01 by^x03 %s^x01!", szVictimName, VictimMoney, szKillerName);
                }
            }
        }
        case 76..80:
        {
            client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was robbed of^x03 0$^x01 by^x03 %s^x01!", szVictimName, szKillerName);
        }
        case 81..95:
        {
            if (VictimMoney > 0)
            {
                new random_amount = random_num(1, VictimMoney);
                VictimMoney -= random_amount;
                KillerMoney += random_amount;
                client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was robbed of^x03 %d$^x01 by^x03 %s^x01!", szVictimName, random_amount, szKillerName);
            }
        }
        case 96..100:
        {
            KillerMoney += VictimMoney;
            client_print_color(0, 0, "^x04[^1CSDM^04]^x03 %s^x01 was completely robbed by^x03 %s^x01!", szVictimName, szKillerName);
            VictimMoney = 0;
        }
    }

#if defined USE_MONEY_UL
    cs_set_user_money_ul(victim, VictimMoney);
    cs_set_user_money_ul(killer, KillerMoney);
#else
    cs_set_user_money(victim, VictimMoney);
    cs_set_user_money(killer, KillerMoney);
#endif
}