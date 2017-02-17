#define WizardStep
image_speed = 0.25
var player = instance_find(obj_nana, 0);

if(m_isAttacking == false && m_isFlashing == false)
{
    //���Player����ʦ���������վ�������ұ�������վ��
    if(power(player.phy_position_x, 2) + power(player.phy_position_y, 2) > 1000000 || m_isWalking == false)
    {
    if(player.phy_position_x <= phy_position_x)
        sprite_index = spr_wizard_stand_left;
    else
        sprite_index = spr_wizard_stand_right;
    }
    
    //�����ʦ��Player�ľ�����1000px�ڣ���ʦ�ͻᷢ������
    if(m_Time == 6)
    {
        if(power(player.phy_position_x, 2) + power(player.phy_position_y, 2) <= 1000000)
        {
            m_isWalking = false;
            Wizard_Skill_Attack();
        }
    }
    
    //�����ʦ��Player�ľ�����1000px�ڣ���ʦ�ͻ�����ƶ���Player���
    if(m_Time == 4)
    {
        if(power(player.phy_position_x, 2) + power(player.phy_position_y, 2) <= 1000000)
        {
            m_isWalking = false;
            Wizard_Skill_Flash();
        }
    }
    
    //�ǹ���״̬�Զ���ܹ���
        if(power(player.phy_position_x, 2) + power(player.phy_position_y, 2) <= 1000000)
    {
        if(m_isAttacking == false && m_isFlashing == false)
        {
            if(player.phy_position_x <= phy_position_x && (player.phy_position_x - phy_position_x <= 50 && player.phy_position_x - phy_position_x >= -50))
                {
                phy_position_x += 2;
                m_isWalking = true;
                }
            else if(player.phy_position_x > phy_position_x && (player.phy_position_x - phy_position_x <= 50 && player.phy_position_x - phy_position_x >= -50))
                {
                phy_position_x -= 2;
                m_isWalking = true;
                }
            else if(player.phy_position_y <= phy_position_y && (player.phy_position_y - phy_position_y <= 50 && player.phy_position_y - phy_position_y >= -50))
                {
                phy_position_y += 2;
                m_isWalking = true;
                }
            else if(player.phy_position_y > phy_position_y && (player.phy_position_y - phy_position_y <= 50 && player.phy_position_y - phy_position_y >= -50))
                {
                phy_position_y -= 2;
                m_isWalking = true;
                }
            else
                m_isWalking = false;
            
            if(m_isWalking = true)
                {
                if(player.phy_position_x <= phy_position_x)
                    sprite_index = spr_wizard_walk_left;
                else
                    sprite_index = spr_wizard_walk_right;
                }
        }
    }
}

if(m_Time == 6.5 && m_isAttacking)
{
    if(keyboard_check(ord('A')))
        var skill = instance_create(player.phy_position_x - 60, player.phy_position_y, obj_effect_wizard_skill);
    else if(keyboard_check(ord('D')))
        var skill = instance_create(player.phy_position_x + 60, player.phy_position_y, obj_effect_wizard_skill);
    else if(keyboard_check(ord('W')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y - 60, obj_effect_wizard_skill);
    else if(keyboard_check(ord('S')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y + 60, obj_effect_wizard_skill);
    else
        var skill = instance_create(player.phy_position_x, player.phy_position_y, obj_effect_wizard_skill);
        
    var skill_range2 = instance_create(skill.x, skill.y, obj_skill_range);
}

if(m_Time == 7 && m_isAttacking)
{
    if(keyboard_check(ord('A')))
        var skill = instance_create(player.phy_position_x - 60, player.phy_position_y, obj_effect_wizard_skill2);
    else if(keyboard_check(ord('D')))
        var skill = instance_create(player.phy_position_x + 60, player.phy_position_y, obj_effect_wizard_skill2);
    else if(keyboard_check(ord('W')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y - 60, obj_effect_wizard_skill2);
    else if(keyboard_check(ord('S')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y + 60, obj_effect_wizard_skill2);
    else
        var skill = instance_create(player.phy_position_x, player.phy_position_y, obj_effect_wizard_skill2);
        
    var skill_range2 = instance_create(skill.x, skill.y, obj_skill_range2);
}

if(m_Time == 7.5 && m_isAttacking)
{
    if(keyboard_check(ord('A')))
        var skill = instance_create(player.phy_position_x - 60, player.phy_position_y, obj_effect_wizard_skill3);
    else if(keyboard_check(ord('D')))
        var skill = instance_create(player.phy_position_x + 60, player.phy_position_y, obj_effect_wizard_skill3);
    else if(keyboard_check(ord('W')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y - 60, obj_effect_wizard_skill3);
    else if(keyboard_check(ord('S')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y + 60, obj_effect_wizard_skill3);
    else
        var skill = instance_create(player.phy_position_x, player.phy_position_y, obj_effect_wizard_skill3);
        
    var skill_range2 = instance_create(skill.x, skill.y, obj_skill_range3);
}

//��ֹ��ʦ�߳�����
if(phy_position_x < 0)
    phy_position_x = 0;
if(phy_position_y < 0)
    phy_position_y = 0;
if(phy_position_x > room_width)
    phy_position_x = room_width;
if(phy_position_y > room_height)
    phy_position_y = room_height;

//��ʦ�ļ�ʱ��
m_Time += 1/30.0;
if(m_Time >= 8)
{
    m_Time = 0;
}

