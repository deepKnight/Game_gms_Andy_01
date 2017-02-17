var player = instance_find(obj_girl, 0);
distance = sqrt(power(player.phy_position_x - phy_position_x, 2) + power(player.phy_position_y - phy_position_y, 2));

//检测是否死亡
if(m_isDead)
    return 0;

//计算生命值
if(m_hp == 0){
    m_isDead = true;
    if(player.phy_position_x >= phy_position_x)
        sprite_index = spr_wizard_dead_left;
    else
        sprite_index = spr_wizard_dead_right;
    return 0;
}

if(m_isAttacking == false && m_isFlashing == false)
{
    //如果Player在巫师左边则向左站立，在右边则向右站立
    if(distance > 1000 || m_isWalking == false)
    {
    if(player.phy_position_x <= phy_position_x)
        sprite_index = spr_wizard_stand_left;
    else
        sprite_index = spr_wizard_stand_right;
    }
    
    //如果巫师跟Player的距离在1000px内，巫师就会发动攻击
    if(m_Time == 6)
    {
        if(distance <= 1000)
        {
            m_isWalking = false;
            Wizard_Skill_Attack();
        }
    }
    
    //如果巫师跟Player的距离在1000px内，或与物体发生碰撞，巫师就会随机移动到Player身边
    if(m_Time == 4 || collision == true
        || phy_position_x == 0 || phy_position_y == 0
        || phy_position_x == room_width || phy_position_y == room_height)
    {
        if(power(player.phy_position_x, 2) + power(player.phy_position_y, 2) <= 1000000)
        {
            m_isWalking = false;
            Wizard_Skill_Flash();
            collision = false;
        }
    }
    
    //非攻击状态自动躲避弓箭
        if(distance <= 1000)
    {
        if(m_isAttacking == false && m_isFlashing == false)
        {
            if(player.phy_position_x <= phy_position_x && (player.phy_position_x - phy_position_x <= 50 && player.phy_position_x - phy_position_x >= -50))
                {
                phy_position_x += walkspeed;
                m_isWalking = true;
                }
            else if(player.phy_position_x > phy_position_x && (player.phy_position_x - phy_position_x <= 50 && player.phy_position_x - phy_position_x >= -50))
                {
                phy_position_x -= walkspeed;
                m_isWalking = true;
                }
            else if(player.phy_position_y <= phy_position_y && (player.phy_position_y - phy_position_y <= 50 && player.phy_position_y - phy_position_y >= -50))
                {
                phy_position_y += walkspeed;
                m_isWalking = true;
                }
            else if(player.phy_position_y > phy_position_y && (player.phy_position_y - phy_position_y <= 50 && player.phy_position_y - phy_position_y >= -50))
                {
                phy_position_y -= walkspeed;
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
        var skill = instance_create(player.phy_position_x - skill_f, player.phy_position_y, obj_effect_wizard_skill);
    else if(keyboard_check(ord('D')))
        var skill = instance_create(player.phy_position_x + skill_f, player.phy_position_y, obj_effect_wizard_skill);
    else if(keyboard_check(ord('W')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y - skill_f, obj_effect_wizard_skill);
    else if(keyboard_check(ord('S')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y + skill_f, obj_effect_wizard_skill);
    else
        var skill = instance_create(player.phy_position_x, player.phy_position_y, obj_effect_wizard_skill);
        
    var skill_range2 = instance_create(skill.x, skill.y, obj_skill_range);
    
    obj = instance_create(1, 1, obj_view_quake);
    
}



if(m_Time == 7 && m_isAttacking)
{
    if(keyboard_check(ord('A')))
        var skill = instance_create(player.phy_position_x - skill_f, player.phy_position_y, obj_effect_wizard_skill2);
    else if(keyboard_check(ord('D')))
        var skill = instance_create(player.phy_position_x + skill_f, player.phy_position_y, obj_effect_wizard_skill2);
    else if(keyboard_check(ord('W')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y - skill_f, obj_effect_wizard_skill2);
    else if(keyboard_check(ord('S')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y + skill_f, obj_effect_wizard_skill2);
    else
        var skill = instance_create(player.phy_position_x, player.phy_position_y, obj_effect_wizard_skill2);
        
    var skill_range2 = instance_create(skill.x, skill.y, obj_skill_range2);
}

if(m_Time == 7.5 && m_isAttacking)
{
    if(keyboard_check(ord('A')))
        var skill = instance_create(player.phy_position_x - skill_f, player.phy_position_y, obj_effect_wizard_skill3);
    else if(keyboard_check(ord('D')))
        var skill = instance_create(player.phy_position_x + skill_f, player.phy_position_y, obj_effect_wizard_skill3);
    else if(keyboard_check(ord('W')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y - skill_f, obj_effect_wizard_skill3);
    else if(keyboard_check(ord('S')))
        var skill = instance_create(player.phy_position_x, player.phy_position_y + skill_f, obj_effect_wizard_skill3);
    else
        var skill = instance_create(player.phy_position_x, player.phy_position_y, obj_effect_wizard_skill3);
        
    var skill_range2 = instance_create(skill.x, skill.y, obj_skill_range3);
}

//防止巫师走出房间
if(phy_position_x < 0)
    phy_position_x = 0;
if(phy_position_y < 0)
    phy_position_y = 0;
if(phy_position_x > room_width)
    phy_position_x = room_width;
if(phy_position_y > room_height)
    phy_position_y = room_height;

//巫师的计时器
m_Time += 1/30.0;
if(m_Time >= 8)
{
    m_Time = 0;
}

