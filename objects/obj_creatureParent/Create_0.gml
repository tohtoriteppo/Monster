/// @description Insert description here
// You can write your code in this editor
player = instance_find(obj_player, 0);
range = 600;
text = "Hey buddy! How's it barking?";
scared = false;
image_speed = 0;
timer = 0;
talkTime = 30;
move_speed = 15;
speech = noone;
scaredSprite = spr_hunter;
runSprite = spr_wolfrun;
talkSprite = spr_wolfbark;
discuss = false;
discussText = "";
start = false;
discussPartner = object_index;