var player = instance_find(obj_girl, 0);
var wizard = instance_find(obj_wizard, 0);

if(m_isAttacking == false)
{
    m_isAttacking = true;
    
    if(player.phy_position_x < phy_position_x)
        wizard.sprite_index = spr_wizard_attack_left;
    else
        wizard.sprite_index = spr_wizard_attack_right;
        
    wizard.image_index = 0;
}

