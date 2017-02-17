if(instance_exists(m_attachedParent))
{
    phy_position_x = m_attachedParent.phy_position_x;
    phy_position_y = m_attachedParent.phy_position_y;
}
if(!instance_exists(m_attachedParent)){
    instance_destroy();
}
