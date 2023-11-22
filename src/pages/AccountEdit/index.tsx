import { useContext } from 'react'
import { AccountEditHost } from '../../components/AccountEditForms/Host'
import { AccountEditTenant } from '../../components/AccountEditForms/Tenant'
import { Container } from './styles'
import { AuthContext } from '../../contexts/Auth/AuthContext'

export function AccountEditPage() {
  const auth = useContext(AuthContext)
  return (
    <Container>
      {auth.user?.role === 'HOST' ? <AccountEditHost /> : <AccountEditTenant />}
    </Container>
  )
}
