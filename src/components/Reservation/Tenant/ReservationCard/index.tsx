import { CancelButton, CardReservation } from './styles'
import { Reservation } from '..'
import axios from 'axios'
import { BaseURL } from '../../../../main'
import { FeedBackComponent } from '../ReservationFeedback'
import { useState } from 'react'

interface ReservationData {
  reservation: Reservation
}

export function ReservationCardTenant({ reservation }: ReservationData) {
  /*   const hotelId = window.location.href.split('/')[6] */

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const items: number[] = [...(new Array(5).keys() as any)]

  const handlePayment = async () => {
    try {
      const response = await axios.post(
        `${BaseURL}/stripe/create-payment/${reservation.id}`,
        null,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 200) {
        const paymentLink = response.data.url
        window.open(paymentLink)
      }
    } catch (e) {
      console.error('Erro ao realizar pagamento: ', e)
    }
  }
  /*   const handleStatusChange = async (modifier: string) => {
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
  } */

  const [activeIndex, setActiveIndex] = useState<number>()

  const onClickStar = (index: number) => {
    setActiveIndex(index)
  }

  const handleClassification = async (classification: number) => {
    if (classification === 0) {
      alert('Classificação precisa ser maior que 0!')
    }
    try {
      console.log(classification)
      const response = await axios.post(
        `${BaseURL}/users/reservations/${reservation.id}/classify`,
        {
          // eslint-disable-next-line object-shorthand
          classification: classification,
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
      console.error('Erro ao classificar', err)
    }
  }

  const handleCancelClassification = async () => {
    try {
      const response = await axios.post(
        `${BaseURL}/users/reservations/${reservation.id}/classify`,
        {
          // eslint-disable-next-line object-shorthand
          classification: 0,
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
      console.error('Erro ao classificar', err)
    }
  }

  const handleCancelChange = async () => {
    try {
      const response = await axios.put(
        `${BaseURL}/users/reservations/cancel`,
        {
          reserveId: reservation.id,
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
      console.error('Erro ao cancelar reserva: ', err)
    }
  }

  return (
    <CardReservation>
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
                  <button className="waiting actbutton">
                    Aguardando confirmação
                  </button>
                  <CancelButton onClick={() => handleCancelChange()}>
                    Cancelar
                  </CancelButton>
                </>
              )}

              {reservation.status === 'PENDING_PAYMENT' && (
                <>
                  <button className="actbutton" onClick={() => handlePayment()}>
                    Realizar Pagamento
                  </button>
                  <CancelButton onClick={() => handleCancelChange()}>
                    Cancelar
                  </CancelButton>
                </>
              )}

              {reservation.status === 'PAID' && (
                <>
                  <button className="waiting actbutton">
                    Esperando Finalização
                  </button>
                </>
              )}

              {reservation.status === 'WAITING_CLASSIFICATION' && (
                <>
                  <div className="starComponent">
                    {items.map((index) => (
                      <FeedBackComponent
                        onClick={() => onClickStar(index)}
                        isActive={index <= activeIndex!}
                        key={`star_${index}`}
                      />
                    ))}
                  </div>
                  <button
                    className="actbutton"
                    onClick={() => handleClassification(activeIndex! + 1)}
                  >
                    Classifique sua experiência
                  </button>
                  <CancelButton onClick={() => handleCancelClassification()}>
                    Não classificar
                  </CancelButton>
                </>
              )}
            </div>
          </>
        )}
    </CardReservation>
  )
}
