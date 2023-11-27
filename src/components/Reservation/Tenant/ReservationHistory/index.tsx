import { Card } from './styles'

interface ReservationData {
  reservationHistory: {
    id: string
    checkIn: string
    checkOut: string
    room: {
      dailyPrice: number
      description: string
      id: string
      maxPeople: number
      name: string
    }
    status: string
    totalPrice: number
    user: {
      id: string
      name: string
    }
  }
}

export function ReservationHistoryTenant({
  reservationHistory,
}: ReservationData) {
  return (
    <Card>
      <>
        <div className="information">
          <div className="primaryInfos">
            <div className="infos">
              <h1>{reservationHistory.room.name}</h1>
              <div className="secondaryInfos">
                <p className="dailyPrice">
                  <strong>Diária: </strong> R$
                  {reservationHistory.room.dailyPrice}
                </p>
                <p className="maxPeople">
                  <strong>Espaço</strong> {reservationHistory.room.maxPeople}{' '}
                  pessoas.
                </p>
              </div>
            </div>
            <div className="pricesInfo">
              <h2>Preço total do aluguel: {reservationHistory.totalPrice}</h2>
              <h3>Entrada: {reservationHistory.checkIn}</h3>
              <h3>Saída: {reservationHistory.checkOut}</h3>
            </div>
          </div>
          <div className="status">
            {reservationHistory.status === 'CANCELED' ? (
              <h3>Cancelado</h3>
            ) : (
              <h3>Finalizado</h3>
            )}
          </div>
        </div>
      </>
    </Card>
  )
}
