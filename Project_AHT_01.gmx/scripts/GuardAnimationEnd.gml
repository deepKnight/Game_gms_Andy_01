if(m_isAttacking && sprite_index == spr_guard_attack_L_UP
    || sprite_index == spr_guard_attack_R_D){
    m_isAttacking = false;
}

if(m_isDead){
    instance_destroy();
}

