quaketime = 1000//震动时间，单位：毫秒
Max_shakelevel = 3;//震动最大幅度，单位：像素
shakefrequency = 1;//震动频率,单位：次/秒

var view = instance_find(obj_view_quake, 0);
time2 = view.time;
shaketimes = 0;
s_t = (quaketime / 1000) * shakefrequency;
s_f = room_speed / shakefrequency;

while(shaketimes < s_t)
{
    if(view.time - time2 > s_f)
    {
    time2 = view.time;
    
    randomize();
    shakelevel = irandom_range(0, Max_shakelevel);
    
    switch(irandom_range(0,1))
    {
        case -1:
            view_xview[0] -= shakelevel;
            break;
        case 0:
            break;
        case 1:
            view_xview[0] += shakelevel;
            break;
    }   
    
    shakelevel = irandom_range(0, Max_shakelevel);
    switch(irandom_range(0,1))
    {
        case -1:
            view_yview[0] -= shakelevel;
            break;
        case 0:
            break;
        case 1:
            view_yview[0] += shakelevel;
            break;
    }  
    
    shaketimes++;
    }
}

instance_destroy();
