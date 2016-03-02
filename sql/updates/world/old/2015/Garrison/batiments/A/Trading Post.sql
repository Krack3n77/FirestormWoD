-- LEVEL 1

	-- (work order gob alliance : 237027)
	INSERT INTO gameobject_template (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `data24`, `data25`, `data26`, `data27`, `data28`, `data29`, `data30`, `data31`, `data32`, `unkInt32`, `BuildVerified`) VALUES(237027, 45, 15585, "Trading Post Work Order", "", "", "", 1, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19702) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `type` = VALUES(`type`), `displayId` = VALUES(`displayId`), `name` = VALUES(`name`), `IconName` = VALUES(`IconName`), `castBarCaption` = VALUES(`castBarCaption`), `unk1` = VALUES(`unk1`), `size` = VALUES(`size`), `questItem1` = VALUES(`questItem1`), `questItem2` = VALUES(`questItem2`), `questItem3` = VALUES(`questItem3`), `questItem4` = VALUES(`questItem4`), `questItem5` = VALUES(`questItem5`), `questItem6` = VALUES(`questItem6`), `data0` = VALUES(`data0`), `data1` = VALUES(`data1`), `data2` = VALUES(`data2`), `data3` = VALUES(`data3`), `data4` = VALUES(`data4`), `data5` = VALUES(`data5`), `data6` = VALUES(`data6`), `data7` = VALUES(`data7`), `data8` = VALUES(`data8`), `data9` = VALUES(`data9`), `data10` = VALUES(`data10`), `data11` = VALUES(`data11`), `data12` = VALUES(`data12`), `data13` = VALUES(`data13`), `data14` = VALUES(`data14`), `data15` = VALUES(`data15`), `data16` = VALUES(`data16`), `data17` = VALUES(`data17`), `data18` = VALUES(`data18`), `data19` = VALUES(`data19`), `data20` = VALUES(`data20`), `data21` = VALUES(`data21`), `data22` = VALUES(`data22`), `data23` = VALUES(`data23`), `data24` = VALUES(`data24`), `data25` = VALUES(`data25`), `data26` = VALUES(`data26`), `data27` = VALUES(`data27`), `data28` = VALUES(`data28`), `data29` = VALUES(`data29`), `data30` = VALUES(`data30`), `data31` = VALUES(`data31`), `data32` = VALUES(`data32`), `unkInt32` = VALUES(`unkInt32`), `BuildVerified` = VALUES(`BuildVerified`);

	UPDATE creature_template SET ScriptName = "npc_TraderJoseph_Garr", npcFlag=3, npcFlag2=32, minlevel=100, maxlevel=100, `exp`=5 WHERE entry=87212;
	REPLACE INTO creature_queststarter VALUE (87212, 37088);
	REPLACE INTO creature_questender VALUE (87212, 37088);

	REPLACE INTO spell_script_names VALUE (174569, "spell_GarrisonRouseTrader");

	-- Krixel Pinchwhistle <Trader>
	UPDATE `creature_template` SET `npcflag`=3, minlevel=100, maxlevel=100, `exp`=5, faction = 35 WHERE `entry`=87200;
	DELETE FROM `npc_vendor` WHERE `entry` IN (87200, 87212) AND `type` = 1;

	DELETE FROM garrison_plot_content WHERE plot_type_or_building=-111 AND faction_index=1;
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-111','1','87212','6.83673','3.43797','1.09345','5.66093');
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-111','1','-237027','11.385','-3.72262','0.581482','2.85857');

-- LEVEL 2

	-- UPDATE plot instance when quest is rewarded (doesn't work yet, need to check events 20-50)
	REPLACE INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) values('87206','0','0','0','50','0','100','0','36948','0','0','0','115','0','0','0','0','0','0','0','0','0','0','0','0','0','0','Type a script description here.');

	DELETE FROM garrison_plot_content WHERE plot_type_or_building = -144 AND faction_index = 1;
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-144','1','85427','3.75467','-0.927572','2.16588','4.8097');
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-144','1','87212','-0.50955','1.16236','2.16656','0.087888');
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-144','1','-237027','8.83224','2.37978','1.66627','4.7553');

	UPDATE creature_template SET npcflag = npcflag | 1 | 2, dynamicflags = dynamicflags | 64, unit_flags2 = unit_flags2 | 1 WHERE entry = 87206;
	REPLACE INTO creature_queststarter VALUE (87206, 36948);
	REPLACE INTO creature_questender VALUE (87206, 36948);

-- LEVEL 3

	DELETE FROM garrison_plot_content WHERE plot_type_or_building = -145 AND faction_index = 1;
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-145','1','-237027','8.05736','-2.93705','1.66566','4.80242');
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-145','1','85427','1.73368','4.68435','2.16562','4.83383');
	insert into `garrison_plot_content` (`plot_type_or_building`, `faction_index`, `creature_or_gob`, `x`, `y`, `z`, `o`) values('-145','1','87212','0.064119','-4.84642','2.16557','0.066467');

-- VENDORS

	DELETE FROM `npc_vendor` WHERE `entry` = 86777 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `PlayerConditionID`) VALUES
	('86777','0','109118','0','0','5413','1','0'), -- or 5415, garrison resources x4
	('86777','0','109119','0','0','5413','1','0'), -- or 5415, garrison resources x4
	('86777','0','109124','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109125','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109126','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109127','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109128','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109129','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109131','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','109132','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','109133','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','109134','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','109135','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','109136','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','109137','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109138','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109139','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109140','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109141','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109142','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109143','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109144','0','0','5412','1','0'), -- garrison resources x8
	('86777','0','109693','0','0','5414','1','0'), -- garrison resources x5
	('86777','0','110609','0','0','5411','1','0'), -- garrison resources x10
	('86777','0','111557','0','0','5413','1','0'), -- garrison resources x4
	('86777','0','120146','0','0','5459','1','0'), -- garrison resources x50
	('86777','0','120147','0','0','5460','1','0'); -- savage blood x1

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=86776;
	DELETE FROM `npc_vendor` WHERE `entry` = 86776 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(86776, 0, 109118, 0, 0, 5411, 1),
	(86776, 0, 109119, 0, 0, 5411, 1),
	(86776, 0, 109124, 0, 0, 5414, 1),
	(86776, 0, 109125, 0, 0, 5414, 1),
	(86776, 0, 109126, 0, 0, 5414, 1),
	(86776, 0, 109127, 0, 0, 5414, 1),
	(86776, 0, 109128, 0, 0, 5414, 1),
	(86776, 0, 109129, 0, 0, 5414, 1),
	(86776, 0, 109131, 0, 0, 5412, 1),
	(86776, 0, 109132, 0, 0, 5412, 1),
	(86776, 0, 109133, 0, 0, 5412, 1),
	(86776, 0, 109134, 0, 0, 5412, 1),
	(86776, 0, 109135, 0, 0, 5412, 1),
	(86776, 0, 109136, 0, 0, 5412, 1),
	(86776, 0, 109137, 0, 0, 5413, 1),
	(86776, 0, 109138, 0, 0, 5413, 1),
	(86776, 0, 109139, 0, 0, 5413, 1),
	(86776, 0, 109140, 0, 0, 5413, 1),
	(86776, 0, 109141, 0, 0, 5413, 1),
	(86776, 0, 109142, 0, 0, 5413, 1),
	(86776, 0, 109143, 0, 0, 5413, 1),
	(86776, 0, 109144, 0, 0, 5413, 1),
	(86776, 0, 109693, 0, 0, 5411, 1),
	(86776, 0, 110609, 0, 0, 5413, 1),
	(86776, 0, 111557, 0, 0, 5414, 1),
	(86776, 0, 115354, 0, 0, 0, 1),
	(86776, 0, 117452, 0, 0, 0, 1),
	(86776, 0, 117472, 0, 0, 0, 1),
	(86776, 0, 117473, 0, 0, 0, 1),
	(86776, 0, 117474, 0, 0, 0, 1),
	(86776, 0, 120146, 0, 0, 5459, 1),
	(86776, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=87203;
	DELETE FROM `npc_vendor` WHERE `entry` = 87203 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(87203, 0, 109118, 0, 0, 5411, 1),
	(87203, 0, 109119, 0, 0, 5411, 1),
	(87203, 0, 109124, 0, 0, 5414, 1),
	(87203, 0, 109125, 0, 0, 5414, 1),
	(87203, 0, 109126, 0, 0, 5414, 1),
	(87203, 0, 109127, 0, 0, 5414, 1),
	(87203, 0, 109128, 0, 0, 5414, 1),
	(87203, 0, 109129, 0, 0, 5414, 1),
	(87203, 0, 109131, 0, 0, 5412, 1),
	(87203, 0, 109132, 0, 0, 5412, 1),
	(87203, 0, 109133, 0, 0, 5412, 1),
	(87203, 0, 109134, 0, 0, 5412, 1),
	(87203, 0, 109135, 0, 0, 5412, 1),
	(87203, 0, 109136, 0, 0, 5412, 1),
	(87203, 0, 109137, 0, 0, 5413, 1),
	(87203, 0, 109138, 0, 0, 5413, 1),
	(87203, 0, 109139, 0, 0, 5413, 1),
	(87203, 0, 109140, 0, 0, 5413, 1),
	(87203, 0, 109141, 0, 0, 5413, 1),
	(87203, 0, 109142, 0, 0, 5413, 1),
	(87203, 0, 109143, 0, 0, 5413, 1),
	(87203, 0, 109144, 0, 0, 5413, 1),
	(87203, 0, 109693, 0, 0, 5411, 1),
	(87203, 0, 110609, 0, 0, 5413, 1),
	(87203, 0, 111557, 0, 0, 5414, 1),
	(87203, 0, 120146, 0, 0, 5459, 1),
	(87203, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=87202;
	DELETE FROM `npc_vendor` WHERE `entry` = 87202 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(87202, 0, 109118, 0, 0, 5413, 1),
	(87202, 0, 109119, 0, 0, 5413, 1),
	(87202, 0, 109124, 0, 0, 5412, 1),
	(87202, 0, 109125, 0, 0, 5412, 1),
	(87202, 0, 109126, 0, 0, 5412, 1),
	(87202, 0, 109127, 0, 0, 5412, 1),
	(87202, 0, 109128, 0, 0, 5412, 1),
	(87202, 0, 109129, 0, 0, 5412, 1),
	(87202, 0, 109131, 0, 0, 5414, 1),
	(87202, 0, 109132, 0, 0, 5414, 1),
	(87202, 0, 109133, 0, 0, 5414, 1),
	(87202, 0, 109134, 0, 0, 5414, 1),
	(87202, 0, 109135, 0, 0, 5414, 1),
	(87202, 0, 109136, 0, 0, 5414, 1),
	(87202, 0, 109137, 0, 0, 5412, 1),
	(87202, 0, 109138, 0, 0, 5412, 1),
	(87202, 0, 109139, 0, 0, 5412, 1),
	(87202, 0, 109140, 0, 0, 5412, 1),
	(87202, 0, 109141, 0, 0, 5412, 1),
	(87202, 0, 109142, 0, 0, 5412, 1),
	(87202, 0, 109143, 0, 0, 5412, 1),
	(87202, 0, 109144, 0, 0, 5412, 1),
	(87202, 0, 109693, 0, 0, 5414, 1),
	(87202, 0, 110609, 0, 0, 5411, 1),
	(87202, 0, 111557, 0, 0, 5413, 1),
	(87202, 0, 120146, 0, 0, 5459, 1),
	(87202, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=87200;
	DELETE FROM `npc_vendor` WHERE `entry` = 87200 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(87200, 0, 109118, 0, 0, 5404, 1),
	(87200, 0, 109119, 0, 0, 5404, 1),
	(87200, 0, 109124, 0, 0, 5411, 1),
	(87200, 0, 109125, 0, 0, 5411, 1),
	(87200, 0, 109126, 0, 0, 5411, 1),
	(87200, 0, 109127, 0, 0, 5411, 1),
	(87200, 0, 109128, 0, 0, 5411, 1),
	(87200, 0, 109129, 0, 0, 5411, 1),
	(87200, 0, 109131, 0, 0, 5413, 1),
	(87200, 0, 109132, 0, 0, 5413, 1),
	(87200, 0, 109133, 0, 0, 5413, 1),
	(87200, 0, 109134, 0, 0, 5413, 1),
	(87200, 0, 109135, 0, 0, 5413, 1),
	(87200, 0, 109136, 0, 0, 5413, 1),
	(87200, 0, 109137, 0, 0, 5414, 1),
	(87200, 0, 109138, 0, 0, 5414, 1),
	(87200, 0, 109139, 0, 0, 5414, 1),
	(87200, 0, 109140, 0, 0, 5414, 1),
	(87200, 0, 109141, 0, 0, 5414, 1),
	(87200, 0, 109142, 0, 0, 5414, 1),
	(87200, 0, 109143, 0, 0, 5414, 1),
	(87200, 0, 109144, 0, 0, 5414, 1),
	(87200, 0, 109693, 0, 0, 5412, 1),
	(87200, 0, 110609, 0, 0, 5412, 1),
	(87200, 0, 111557, 0, 0, 5411, 1),
	(87200, 0, 120146, 0, 0, 5459, 1),
	(87200, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=87201;
	DELETE FROM `npc_vendor` WHERE `entry` = 87201 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(87201, 0, 109118, 0, 0, 5412, 1),
	(87201, 0, 109119, 0, 0, 5412, 1),
	(87201, 0, 109124, 0, 0, 5413, 1),
	(87201, 0, 109125, 0, 0, 5413, 1),
	(87201, 0, 109126, 0, 0, 5413, 1),
	(87201, 0, 109127, 0, 0, 5413, 1),
	(87201, 0, 109128, 0, 0, 5413, 1),
	(87201, 0, 109129, 0, 0, 5413, 1),
	(87201, 0, 109131, 0, 0, 5411, 1),
	(87201, 0, 109132, 0, 0, 5411, 1),
	(87201, 0, 109133, 0, 0, 5411, 1),
	(87201, 0, 109134, 0, 0, 5411, 1),
	(87201, 0, 109135, 0, 0, 5411, 1),
	(87201, 0, 109136, 0, 0, 5411, 1),
	(87201, 0, 109137, 0, 0, 5411, 1),
	(87201, 0, 109138, 0, 0, 5411, 1),
	(87201, 0, 109139, 0, 0, 5411, 1),
	(87201, 0, 109140, 0, 0, 5411, 1),
	(87201, 0, 109141, 0, 0, 5411, 1),
	(87201, 0, 109142, 0, 0, 5411, 1),
	(87201, 0, 109143, 0, 0, 5411, 1),
	(87201, 0, 109144, 0, 0, 5411, 1),
	(87201, 0, 109693, 0, 0, 5413, 1),
	(87201, 0, 110609, 0, 0, 5412, 1),
	(87201, 0, 111557, 0, 0, 5412, 1),
	(87201, 0, 120146, 0, 0, 5459, 1),
	(87201, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=87204;
	DELETE FROM `npc_vendor` WHERE `entry` = 87204 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(87204, 0, 109118, 0, 0, 5404, 1),
	(87204, 0, 109119, 0, 0, 5404, 1),
	(87204, 0, 109124, 0, 0, 5404, 1),
	(87204, 0, 109125, 0, 0, 5404, 1),
	(87204, 0, 109126, 0, 0, 5404, 1),
	(87204, 0, 109127, 0, 0, 5404, 1),
	(87204, 0, 109128, 0, 0, 5404, 1),
	(87204, 0, 109129, 0, 0, 5404, 1),
	(87204, 0, 109131, 0, 0, 5404, 1),
	(87204, 0, 109132, 0, 0, 5404, 1),
	(87204, 0, 109133, 0, 0, 5404, 1),
	(87204, 0, 109134, 0, 0, 5404, 1),
	(87204, 0, 109135, 0, 0, 5404, 1),
	(87204, 0, 109136, 0, 0, 5404, 1),
	(87204, 0, 109137, 0, 0, 5404, 1),
	(87204, 0, 109138, 0, 0, 5404, 1),
	(87204, 0, 109139, 0, 0, 5404, 1),
	(87204, 0, 109140, 0, 0, 5404, 1),
	(87204, 0, 109141, 0, 0, 5404, 1),
	(87204, 0, 109142, 0, 0, 5404, 1),
	(87204, 0, 109143, 0, 0, 5404, 1),
	(87204, 0, 109144, 0, 0, 5404, 1),
	(87204, 0, 109693, 0, 0, 5404, 1),
	(87204, 0, 110609, 0, 0, 5404, 1),
	(87204, 0, 111557, 0, 0, 5404, 1),
	(87204, 0, 120146, 0, 0, 5459, 1),
	(87204, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=86778;
	DELETE FROM `npc_vendor` WHERE `entry` = 86778 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(86778, 0, 109118, 0, 0, 5412, 1),
	(86778, 0, 109119, 0, 0, 5412, 1),
	(86778, 0, 109124, 0, 0, 5413, 1),
	(86778, 0, 109125, 0, 0, 5413, 1),
	(86778, 0, 109126, 0, 0, 5413, 1),
	(86778, 0, 109127, 0, 0, 5413, 1),
	(86778, 0, 109128, 0, 0, 5413, 1),
	(86778, 0, 109129, 0, 0, 5413, 1),
	(86778, 0, 109131, 0, 0, 5411, 1),
	(86778, 0, 109132, 0, 0, 5411, 1),
	(86778, 0, 109133, 0, 0, 5411, 1),
	(86778, 0, 109134, 0, 0, 5411, 1),
	(86778, 0, 109135, 0, 0, 5411, 1),
	(86778, 0, 109136, 0, 0, 5411, 1),
	(86778, 0, 109137, 0, 0, 5411, 1),
	(86778, 0, 109138, 0, 0, 5411, 1),
	(86778, 0, 109139, 0, 0, 5411, 1),
	(86778, 0, 109140, 0, 0, 5411, 1),
	(86778, 0, 109141, 0, 0, 5411, 1),
	(86778, 0, 109142, 0, 0, 5411, 1),
	(86778, 0, 109143, 0, 0, 5411, 1),
	(86778, 0, 109144, 0, 0, 5411, 1),
	(86778, 0, 109693, 0, 0, 5413, 1),
	(86778, 0, 110609, 0, 0, 5412, 1),
	(86778, 0, 111557, 0, 0, 5412, 1),
	(86778, 0, 120146, 0, 0, 5459, 1),
	(86778, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=86779;
	DELETE FROM `npc_vendor` WHERE `entry` = 86779 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(86779, 0, 109118, 0, 0, 5404, 1),
	(86779, 0, 109119, 0, 0, 5404, 1),
	(86779, 0, 109124, 0, 0, 5411, 1),
	(86779, 0, 109125, 0, 0, 5411, 1),
	(86779, 0, 109126, 0, 0, 5411, 1),
	(86779, 0, 109127, 0, 0, 5411, 1),
	(86779, 0, 109128, 0, 0, 5411, 1),
	(86779, 0, 109129, 0, 0, 5411, 1),
	(86779, 0, 109131, 0, 0, 5413, 1),
	(86779, 0, 109132, 0, 0, 5413, 1),
	(86779, 0, 109133, 0, 0, 5413, 1),
	(86779, 0, 109134, 0, 0, 5413, 1),
	(86779, 0, 109135, 0, 0, 5413, 1),
	(86779, 0, 109136, 0, 0, 5413, 1),
	(86779, 0, 109137, 0, 0, 5414, 1),
	(86779, 0, 109138, 0, 0, 5414, 1),
	(86779, 0, 109139, 0, 0, 5414, 1),
	(86779, 0, 109140, 0, 0, 5414, 1),
	(86779, 0, 109141, 0, 0, 5414, 1),
	(86779, 0, 109142, 0, 0, 5414, 1),
	(86779, 0, 109143, 0, 0, 5414, 1),
	(86779, 0, 109144, 0, 0, 5414, 1),
	(86779, 0, 109693, 0, 0, 5412, 1),
	(86779, 0, 110609, 0, 0, 5412, 1),
	(86779, 0, 111557, 0, 0, 5411, 1),
	(86779, 0, 120146, 0, 0, 5459, 1),
	(86779, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=86776;
	DELETE FROM `npc_vendor` WHERE `entry` = 86776 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(86776, 0, 109118, 0, 0, 5411, 1),
	(86776, 0, 109119, 0, 0, 5411, 1),
	(86776, 0, 109124, 0, 0, 5414, 1),
	(86776, 0, 109125, 0, 0, 5414, 1),
	(86776, 0, 109126, 0, 0, 5414, 1),
	(86776, 0, 109127, 0, 0, 5414, 1),
	(86776, 0, 109128, 0, 0, 5414, 1),
	(86776, 0, 109129, 0, 0, 5414, 1),
	(86776, 0, 109131, 0, 0, 5412, 1),
	(86776, 0, 109132, 0, 0, 5412, 1),
	(86776, 0, 109133, 0, 0, 5412, 1),
	(86776, 0, 109134, 0, 0, 5412, 1),
	(86776, 0, 109135, 0, 0, 5412, 1),
	(86776, 0, 109136, 0, 0, 5412, 1),
	(86776, 0, 109137, 0, 0, 5413, 1),
	(86776, 0, 109138, 0, 0, 5413, 1),
	(86776, 0, 109139, 0, 0, 5413, 1),
	(86776, 0, 109140, 0, 0, 5413, 1),
	(86776, 0, 109141, 0, 0, 5413, 1),
	(86776, 0, 109142, 0, 0, 5413, 1),
	(86776, 0, 109143, 0, 0, 5413, 1),
	(86776, 0, 109144, 0, 0, 5413, 1),
	(86776, 0, 109693, 0, 0, 5411, 1),
	(86776, 0, 110609, 0, 0, 5413, 1),
	(86776, 0, 111557, 0, 0, 5414, 1),
	(86776, 0, 115354, 0, 0, 0, 1),
	(86776, 0, 117452, 0, 0, 0, 1),
	(86776, 0, 117472, 0, 0, 0, 1),
	(86776, 0, 117473, 0, 0, 0, 1),
	(86776, 0, 117474, 0, 0, 0, 1),
	(86776, 0, 120146, 0, 0, 5459, 1),
	(86776, 0, 120147, 0, 0, 5460, 1);

	UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=86683;
	DELETE FROM `npc_vendor` WHERE `entry` = 86683 AND `type` = 1;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(86683, 0, 109118, 0, 0, 5404, 1),
	(86683, 0, 109119, 0, 0, 5404, 1),
	(86683, 0, 109124, 0, 0, 5404, 1),
	(86683, 0, 109125, 0, 0, 5404, 1),
	(86683, 0, 109126, 0, 0, 5404, 1),
	(86683, 0, 109127, 0, 0, 5404, 1),
	(86683, 0, 109128, 0, 0, 5404, 1),
	(86683, 0, 109129, 0, 0, 5404, 1),
	(86683, 0, 109131, 0, 0, 5404, 1),
	(86683, 0, 109132, 0, 0, 5404, 1),
	(86683, 0, 109133, 0, 0, 5404, 1),
	(86683, 0, 109134, 0, 0, 5404, 1),
	(86683, 0, 109135, 0, 0, 5404, 1),
	(86683, 0, 109136, 0, 0, 5404, 1),
	(86683, 0, 109137, 0, 0, 5404, 1),
	(86683, 0, 109138, 0, 0, 5404, 1),
	(86683, 0, 109139, 0, 0, 5404, 1),
	(86683, 0, 109140, 0, 0, 5404, 1),
	(86683, 0, 109141, 0, 0, 5404, 1),
	(86683, 0, 109142, 0, 0, 5404, 1),
	(86683, 0, 109143, 0, 0, 5404, 1),
	(86683, 0, 109144, 0, 0, 5404, 1),
	(86683, 0, 109693, 0, 0, 5404, 1),
	(86683, 0, 110609, 0, 0, 5404, 1),
	(86683, 0, 111557, 0, 0, 5404, 1),
	(86683, 0, 120146, 0, 0, 5459, 1),
	(86683, 0, 120147, 0, 0, 5460, 1);