if(m_isAttacking && sprite_index == spr_girl_attack_side
    || sprite_index == spr_girl_attack_front
    || sprite_index == spr_girl_attack_back){
    m_isAttacking = false;
}
if(m_isDead){
    image_index = -1;
    image_speed = 0.25;
}

