import { isHost } from '../../App'
import { AccountEditHost } from '../../components/AccountEditForms/Host'
import { AccountEditTenant } from '../../components/AccountEditForms/Tenant'
import { Container } from './styles'

export function AccountEditPage() {
  /*   if (!isLogged) {
    window.location.href = '/login'
  } */
  if (!isHost) {
    return (
      <Container>
        <AccountEditHost />
      </Container>
    )
  } else {
    return (
      <Container>
        <AccountEditTenant />
      </Container>
    )
  }
}
