import { Container } from './styles'
/* import { AccountFormTenant } from '../../components/AccountForms/Tenant' */
import { AccountFormHost } from '../../components/AccountForms/Host'
import { useContext } from 'react'
import { AuthContext } from '../../contexts/Auth/AuthContext'
import { AccountFormTenant } from '../../components/AccountForms/Tenant'

export function AccountPage() {
  const auth = useContext(AuthContext)
  console.log(auth.user?.role)

  return (
    <Container>
      {auth.user?.role === 'HOST' ? <AccountFormHost /> : <AccountFormTenant />}
    </Container>
  )
}
