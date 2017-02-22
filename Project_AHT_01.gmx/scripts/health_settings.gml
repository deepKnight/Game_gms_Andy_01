max_health = 3; //Player最大血量
health_x = 10; //血条左上角x坐标
health_y = 10; //血条左上角y坐标
health_interval = 10; //每个爱心间间隔（忽略爱心宽度）

hp = instance_find(obj_health,0);
hp.max_health = max_health;
hp.current_health = max_health;
hp.health_x = health_x;
hp.health_y = health_y;
hp.health_interval = health_interval;
