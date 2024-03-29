import { Card } from './styles'

interface ReservationData {
  reservationHistory: {
    id: string
    user: {
      id: string
      name: string
      email: string
    }
    status: string
    checkIn: string
    checkOut: string
    hotel: null
    room: {
      id: string
      name: string
      description: string
      dailyPrice: number
      maxPeople: number
    }
    totalPrice: number
    classification: number
  }
}

export function ReservationHistory({ reservationHistory }: ReservationData) {
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
              <div className="tenantInfos">
                <h2>Solicitação feita por: {reservationHistory.user.name}</h2>
                <p>{reservationHistory.user.email}</p>
              </div>
            </div>
            <div className="pricesInfo">
              <h2>Preço total do aluguel: {reservationHistory.totalPrice}</h2>
              <h3>Entrada: {reservationHistory.checkIn}</h3>
              <h3>Saída: {reservationHistory.checkOut}</h3>
              <h3>
                {reservationHistory.classification === 0 ? (
                  <>Não Classificado</>
                ) : (
                  <>
                    Classificação:{' '}
                    {reservationHistory.classification.toFixed(2)} Estrelas
                  </>
                )}
              </h3>
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
