#define Wizard_Skill_Flash
var player = instance_find(obj_nana, 0);
//����ʦ�����������֡������ȹ����У���ʼ����
if(m_isFlashing == false)
{
    m_isFlashing = true
    
    var flash = instance_create(phy_position_x, phy_position_y - 50, obj_effect_wizard_flash);
    
    //������������Ҿ���Player 100������200�����ڵ���������
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

