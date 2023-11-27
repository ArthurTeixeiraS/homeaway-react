import { Card } from './styles'
import { Reservation } from '..'
import axios from 'axios'
import { BaseURL } from '../../../../main'

interface ReservationData {
  reservation: Reservation
}

export function ReservationCard({ reservation }: ReservationData) {
  const hotelId = window.location.href.split('/')[6]

  const handleStatusChange = async (modifier: string) => {
    try {
      const response = await axios.post(
        `${BaseURL}/hotels/${hotelId}/reservations/${reservation.id}`,
        {
          reserveStatus: modifier,
        },
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 200) {
        window.location.reload()
      }
    } catch (err) {
      console.error('Erro ao realizar reserva', err)
    }
  }

  return (
    <Card>
      {reservation.status !== 'CANCELED' &&
        reservation.status !== 'FINISHED' && (
          <>
            <div className="information">
              <div className="infos">
                <h1>{reservation.room.name}</h1>
                <div className="secondaryInfos">
                  <p className="dailyPrice">
                    <strong>Diária: </strong> R$
                    {reservation.room.dailyPrice}
                  </p>
                  <p className="maxPeople">
                    <strong>Espaço</strong> {reservation.room.maxPeople}{' '}
                    pessoas.
                  </p>
                </div>
                <div className="tenantInfos">
                  <h2>Solicitação feita por: {reservation.user.name}</h2>
                  <p>{reservation.user.email}</p>
                </div>
              </div>
              <div className="pricesInfo">
                <h2>Preço total do aluguel: {reservation.totalPrice}</h2>
                <h3>Entrada: {reservation.checkIn}</h3>
                <h3>Saída: {reservation.checkOut}</h3>
              </div>
            </div>
            <div className="buttons">
              {reservation.status === 'WAITING_CONFIRMATION' && (
                <>
                  <button onClick={() => handleStatusChange('PENDING_PAYMENT')}>
                    Confirmar Solicitação
                  </button>
                  <button
                    id="removebtn"
                    onClick={() => handleStatusChange('CANCELED')}
                  >
                    Recusar Solicitação
                  </button>
                </>
              )}
              {reservation.status === 'PENDING_PAYMENT' && (
                <button className="waiting">Aguardando Pagamento</button>
              )}
              {reservation.status === 'PAID' && (
                <button
                  onClick={() => handleStatusChange('WAITING_CLASSIFICATION')}
                >
                  Finalizar Reserva
                </button>
              )}
              {reservation.status === 'WAITING_CLASSIFICATION' && (
                <button className="waiting">Aguardando Classificação</button>
              )}
            </div>
          </>
        )}
    </Card>
  )
}
