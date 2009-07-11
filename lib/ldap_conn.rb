require 'ldap'

def ldap_authenticated?(login,password)
  return false if password.blank?
  ldap_host = 'ldap.hs-furtwangen.de' #LDAP server IP
  ldap_port = 389

  begin
    ldap_conn = LDAP::Conn.new(ldap_host, ldap_port)
    ldap_conn.set_option( LDAP::LDAP_OPT_PROTOCOL_VERSION, 3 )
    ldap_conn.bind( login, password )
    true
  rescue
    return false
  end  
end