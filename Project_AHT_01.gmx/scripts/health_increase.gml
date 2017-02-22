hp = instance_find(obj_health, 0);
current_health = hp.current_health;
with (obj_health)
   {
    instance_destroy();
   }
hp = instance_create(0,0,obj_health);

hp.current_health = current_health;
if(current_health + 1 <= hp.max_health)
    {
    hp.current_health = current_health + 1;
    }
