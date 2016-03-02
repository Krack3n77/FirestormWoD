////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2014-2015 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
#include "HTradingPost.hpp"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "GameObjectAI.h"
#include "Spell.h"
#include "GarrisonMgr.hpp"

namespace MS { namespace Garrison 
{
    //////////////////////////////////////////////////////////////////////////
    /// 87112 - Fayla Fairfeather                                          ///
    //////////////////////////////////////////////////////////////////////////

    /// Constructor
    npc_FaylaFairfeather::npc_FaylaFairfeather()
        : CreatureScript("npc_FaylaFairfeather_Garr")
    {

    }

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////

    /// Called when a player opens a gossip dialog with the GameObject.
    /// @p_Player     : Source player instance
    /// @p_Creature   : Target GameObject instance
    bool npc_FaylaFairfeather::OnGossipHello(Player* p_Player, Creature* p_Creature)
    {
        Quest const* l_Quest = sObjectMgr->GetQuestTemplate(Quests::Horde_TricksOfTheTrade);

        if (l_Quest == nullptr)
            return false;

        if (p_Player->IsQuestRewarded(Quests::Horde_TricksOfTheTrade) || (p_Player->GetQuestStatus(Quests::Horde_TricksOfTheTrade) == QUEST_STATUS_INCOMPLETE))
        {
            p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I would like to place an order.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            p_Player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, p_Creature->GetGUID());
        }
        else if (p_Player->GetQuestStatus(Quests::Horde_TricksOfTheTrade) == QUEST_STATUS_NONE)
            p_Player->PlayerTalkClass->SendQuestGiverQuestDetails(l_Quest, p_Creature->GetGUID());
        else if (p_Player->GetQuestStatus(Quests::Horde_TricksOfTheTrade) == QUEST_STATUS_COMPLETE)
            p_Player->PlayerTalkClass->SendQuestGiverOfferReward(l_Quest, p_Creature->GetGUID());

        return true;
    }

    bool npc_FaylaFairfeather::OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 p_Sender, uint32 p_Action)
    {
        p_Player->PlayerTalkClass->ClearMenus();
        CreatureAI* l_AI = p_Creature->AI();

        if (l_AI == nullptr || p_Creature == nullptr || p_Creature->GetScriptName() != CreatureScript::GetName())
            return true;

        if (p_Action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            if (p_Player && p_Creature && p_Creature->GetScriptName() == GetName())
                reinterpret_cast<GarrisonNPCAI*>(l_AI)->SendShipmentCrafterUI(p_Player);
        }

        return true;
    }

    bool npc_FaylaFairfeather::OnQuestReward(Player* p_Player, Creature* p_Creature, const Quest* p_Quest, uint32 p_Option)
    {
        if (p_Quest->GetQuestId() == Quests::Horde_TricksOfTheTrade)
        {
            if (p_Player && p_Creature)
            {
                if (MS::Garrison::Manager* l_GarrisonMgr = p_Player->GetGarrison())
                {
                    CreatureAI* l_AI = p_Creature->AI();

                    if (l_AI == nullptr)
                        return true;

                    if (GarrisonNPCAI* l_GarrisonAI = dynamic_cast<GarrisonNPCAI*>(l_AI))
                        l_GarrisonMgr->ActivateBuilding(l_GarrisonAI->GetPlotInstanceID());
                }
            }
        }

        return true;
    }

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////

    /// Called when a CreatureAI object is needed for the creature.
    /// @p_Creature : Target creature instance
    CreatureAI* npc_FaylaFairfeather::GetAI(Creature* p_Creature) const
    {
        return new npc_FaylaFairfeatherAI(p_Creature);
    }

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////

    /// Constructor
    npc_FaylaFairfeather::npc_FaylaFairfeatherAI::npc_FaylaFairfeatherAI(Creature* p_Creature)
        : GarrisonNPCAI(p_Creature)
    {
    }

    void npc_FaylaFairfeather::npc_FaylaFairfeatherAI::OnPlotInstanceUnload()
    {
        me->DespawnCreaturesInArea(std::vector<uint32> {NPCs::NpcHordeAncientTradingMechanismQuestGiver, NPCs::NpcHordeAncientTradingMechanismAuctioneer}, 100.0f);
    }

    void npc_FaylaFairfeather::npc_FaylaFairfeatherAI::OnSetPlotInstanceID(uint32 p_PlotInstanceID)
    {
        Player* l_Owner = GetOwner();

        if (l_Owner == nullptr)
            return;

        Manager* l_GarrisonMgr = l_Owner->GetGarrison();

        if (l_GarrisonMgr == nullptr)
            return;

        SequencePosition l_NpcVendorPos;

        switch (l_GarrisonMgr->GetBuilding(p_PlotInstanceID).BuildingID)
        {
            case Buildings::TradingPost__TradingPost_Level1:
                l_NpcVendorPos = { 2.3595f, -5.2689f, 0.5832f, 1.2362f };
                break;
            case Buildings::TradingPost__TradingPost_Level2:
                if (l_Owner->GetQuestStatus(Quests::Alliance_AuctionningForParts) != QUEST_STATUS_REWARDED)
                    SummonRelativeCreature(NPCs::NpcAllianceAncientTradingMechanismQuestGiver, 4.7426f, -8.5494f, 1.6656f, 1.4341f, TEMPSUMMON_MANUAL_DESPAWN);
                else
                    SummonRelativeCreature(NPCs::NpcAllianceAncientTradingMechanismAuctioneer, 4.7426f, -8.5494f, 1.6656f, 1.4341f, TEMPSUMMON_MANUAL_DESPAWN);

                l_NpcVendorPos = { 3.5440f, 2.2147f, 1.6656f, 5.9672f };
                break;
            case Buildings::TradingPost__TradingPost_Level3:
                l_NpcVendorPos = { 14.5129f, -4.9367f, 1.6736f, 1.6161f };
                break;
            default:
                break;
        }

        uint32 l_NpcID = l_Owner->GetCharacterWorldStateValue(CharacterWorldStates::CharWorldStateGarrisonTradingPostDailyRandomTrader);

        if (!l_NpcID) ///< Quest or daily refill not done
            return;

        if (Creature* l_Creature = me->FindNearestCreature(l_NpcID, 30.0f))
            l_Creature->DespawnOrUnsummon();


        l_NpcVendorPos = { 7.4031f, -15.7592f, 1.6757f, 2.0719f };

        SummonRelativeCreature(l_NpcID, l_NpcVendorPos, TEMPSUMMON_MANUAL_DESPAWN);

        l_Owner->SetCharacterWorldState(CharacterWorldStates::CharWorldStateGarrisonTradingPostDailyRandomTrader, l_NpcID);
        l_Owner->SaveToDB();
    }

    void npc_FaylaFairfeather::npc_FaylaFairfeatherAI::OnDataReset()
    {
        if (GetOwner() != nullptr)
        {
            MS::Garrison::Manager* l_GarrisonMgr = GetOwner()->GetGarrison();

            if (l_GarrisonMgr == nullptr)
                return;

            std::vector<uint32> l_TradersEntries = { 86778, 86777, 86779, 86776, 86683 };
            uint32 l_Entry = 0;

            if (l_TradersEntries.empty())
                return;

            l_Entry = l_TradersEntries[urand(0, l_TradersEntries.size() - 1)];

            GetOwner()->SetCharacterWorldState(CharacterWorldStates::CharWorldStateGarrisonTradingPostDailyRandomTrader, l_Entry);
            GetOwner()->SaveToDB();

            OnSetPlotInstanceID(GetPlotInstanceID());
        }
    }

}   ///< namespace Garrison
}   ///< namespace MS