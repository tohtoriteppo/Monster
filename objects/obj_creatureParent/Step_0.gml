/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(player)<range and !start)
{
	if(player.sprite_index == scaredSprite)
	{
		if(!scared)
		{
			timer = 40;
			scared = true
			sprite_index = runSprite;
		}
		if(player.x < x)
		{
			image_xscale = -1;
		}
	}
	else
	{

		if(speech == noone)
		{
			speech = instance_create_layer(x+sprite_width*0, y-sprite_height*0.5, "Instances", obj_speech);
			with (speech)
			{
				y -= sprite_height;
			}
			speech.depth = depth-1;
			speech.text = text;
			timer = talkTime;
			
			if(string_length(speech.text) > 27)
			{
				speech.image_yscale = 1.5;
				speech.image_xscale = 1.05;
				//speech.y -= 16;
			}
			if(discuss)
			{
				speech.text = discussText;
				var cret = instance_nearest(x+300,y,discussPartner);
				if(cret.start)
				{
					speech.x = x - speech.sprite_width * speech.image_xscale;
				}
				timer = talkTime;
			}
			
			sprite_index = talkSprite;
			image_speed = 1;
			
			
		}
		
		//if(instance_exists(speech))
		//{
		//	var xpos = x; 
		//	with(speech)
		//	{
		//		if(place_meeting(x,y,obj_speech))
		//		{
		//			var spe = instance_place(x,y,obj_speech);
		//			if(x < spe.x)
		//			{
		//				x = xpos - sprite_width * image_xscale;
		//			}
					
		//		}
		//	}
			
		//}
		if(!discuss)
		{
			if(player.x < x)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = 1;
			}
		}
		
	}
}
timer--;
if(scared and timer <= 0)
{
	x += move_speed;
	image_speed = 1;
	image_xscale = 1;
}
else if(speech != noone and timer < 0)
{
	image_speed = 0;
	if(timer < -90)
	{
		instance_destroy(speech);
		var offset = image_xscale > 0 ? 300 : -300;
		var cret = instance_nearest(x+offset,y,discussPartner);
		if(cret.start)
		{
			//speech.x = x - speech.sprite_width * speech.image_xscale;
			cret.start = false;
			if(discussText != text)
			{
				discussText = text;
				//text = "";
				start = true;
				speech = noone;
				discuss = false;
			}
			
			
		}
		
	}
}