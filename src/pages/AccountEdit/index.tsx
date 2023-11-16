import { isHost } from '../../App'
import { AccountEditHost } from '../../components/AccountEditForms/Host'
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
        <h1>Sou host</h1>
      </Container>
    )
  }
}
