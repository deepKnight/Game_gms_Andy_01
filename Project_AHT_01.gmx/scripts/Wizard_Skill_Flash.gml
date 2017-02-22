var player = instance_find(obj_girl, 0);
//若巫师并非正在闪现、攻击等过程中，则开始闪现
if(m_isFlashing == false)
{
    m_isFlashing = true
    
    audio_play_sound(s_wizard_flash, 2, false);
    
    var flash = instance_create(phy_position_x, phy_position_y - 50, obj_effect_wizard_flash);
    
    //随机向上下左右距离Player 100像素外200像素内的区域闪现
    randomize();
    switch(irandom_range(1,4))
    {
    case 1:
    phy_position_x = player.phy_position_x + irandom_range(100,200);
    phy_position_y = player.phy_position_y + irandom_range(100,200);
    break;
    case 2:
    phy_position_x = player.phy_position_x - irandom_range(100,200);
    phy_position_y = player.phy_position_y - irandom_range(100,200);
    break;
    case 3:
    phy_position_x = player.phy_position_x + irandom_range(100,200);
    phy_position_y = player.phy_position_y - irandom_range(100,200);
    break;
    case 4:
    phy_position_x = player.phy_position_x - irandom_range(100,200);
    phy_position_y = player.phy_position_y + irandom_range(100,200);
    break;
    }
    
    var flash2 = instance_create(phy_position_x, phy_position_y, obj_effect_wizard_flash2);
    
    m_isFlashing = false
}

