if(instance_exists(m_attachedParent))
{
    phy_position_x = m_attachedParent.x;
    phy_position_y = m_attachedParent.y;
}
if(!instance_exists(m_attachedParent)){
    instance_destroy();
}
