import { useContext } from 'react'
import { Container } from '../MyHotels/styles'
import { AuthContext } from '../../contexts/Auth/AuthContext'

export function ReservationPage() {
  const auth = useContext(AuthContext)
  return (
    <Container>
      {auth.user?.role === 'TENANT' ? (
        <h1>Pagina de reservas do Cliente</h1>
      ) : (
        <h1>Pagina de reservas do Propietário</h1>
      )}
    </Container>
  )
}
