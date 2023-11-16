import { isHost } from '../../App'
import { Container } from './styles'
import { AccountFormTenant } from '../../components/AccountForms/Tenant'
import { AccountFormHost } from '../../components/AccountForms/Host'

export function AccountPage() {
  /*  if (!isLogged) {
    window.location.href = '/login'
  } */
  if (isHost) {
    return (
      <Container>
        <AccountFormTenant />
      </Container>
    )
  } else {
    return (
      <Container>
        <AccountFormHost />
      </Container>
    )
  }
}