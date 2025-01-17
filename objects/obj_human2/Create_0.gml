/// @description Insert description here
// You can write your code in this editor
player = instance_find(obj_player, 0);
range = 600;
text = "Hey man! How's it going?";
scared = false;
image_speed = 0;
timer = 0;
talkTime = 50;
move_speed = 15;
speech = noone;
scaredSprite = spr_wolfwalk;
runSprite = spr_human2;
talkSprite = spr_human2;
discuss = false;
start = false;
discussPartner = object_index;