#define WizardAnimationEnd
if(m_isAttacking == true
    && (sprite_index == spr_wizard_attack_left
    || sprite_index == spr_wizard_attack_right))
    {
    m_isAttacking = false;
    m_isWalking = true;
    }

