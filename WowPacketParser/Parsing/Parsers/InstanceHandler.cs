using System;
using WowPacketParser.Enums;
using WowPacketParser.Misc;

namespace WowPacketParser.Parsing.Parsers
{
    public static class InstanceHandler
    {
        [Parser(Opcode.MSG_SET_DUNGEON_DIFFICULTY)]
        [Parser(Opcode.MSG_SET_RAID_DIFFICULTY)]
        public static void HandleSetDifficulty(Packet packet)
        {
            packet.ReadEnum<MapDifficulty>("Difficulty", TypeCode.Int32);
            if (packet.GetDirection() != Direction.ServerToClient)
                return;

            packet.ReadInt32("Unk Int32");
            packet.ReadInt32("In Group");
        }

        [Parser(Opcode.SMSG_INSTANCE_DIFFICULTY)]
        public static void HandleInstanceDifficulty(Packet packet)
        {
            packet.ReadEnum<MapDifficulty>("Difficulty", TypeCode.Int32);
            packet.ReadInt32("Player Difficulty");
        }

        [Parser(Opcode.SMSG_CHANGEPLAYER_DIFFICULTY_RESULT)]
        public static void HandlePlayerChangeDifficulty(Packet packet)
        {
            var type = packet.ReadEnum<DifficultyChangeType>("Change Type", TypeCode.Int32);
            switch (type)
            {
                case DifficultyChangeType.PlayerDifficulty1:
                    packet.ReadByte("Player Difficulty");
                    break;
                case DifficultyChangeType.SpellDuration:
                    packet.ReadInt32("Spell Duration");
                    break;
                case DifficultyChangeType.Time:
                    packet.ReadInt32("Time");
                    break;
                case DifficultyChangeType.MapDifficulty:
                    packet.ReadEnum<MapDifficulty>("Difficulty", TypeCode.Int32);
                    break;
            }
        }

        [Parser(Opcode.SMSG_RESET_FAILED_NOTIFY)]
        public static void HandleResetFailedNotify(Packet packet)
        {
            Console.WriteLine("Map Id: " + Extensions.MapLine(packet.ReadInt32()));
        }

        [Parser(Opcode.MSG_RAID_TARGET_UPDATE)]
        public static void HandleRaidTargetUpdate(Packet packet)
        {
            var type = packet.ReadByte("Type");
            if (type == 0)
            {
                packet.ReadGuid("Who GUID");
                packet.ReadByte("Icon Id");
                packet.ReadGuid("Target GUID");
            }
            else if (type != 255 && packet.GetDirection() == Direction.ClientToServer)
                packet.ReadGuid("Target GUID");
        }
    }
}
