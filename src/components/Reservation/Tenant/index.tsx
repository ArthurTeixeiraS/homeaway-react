import { Link } from 'react-router-dom'
import { Container } from './styles'
import { FaArrowLeft } from 'react-icons/fa'
import { useContext, useEffect, useState } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'
import axios from 'axios'
import { BaseURL } from '../../../main'
import { ReservationCardTenant } from './ReservationCard'
import { ReservationHistoryTenant } from './ReservationHistory'

export interface ReservationHistory {
  id: string
  user: {
    id: string
    name: string
  }
  status: string
  checkIn: string
  checkOut: string
  hotel: {
    id: string
    name: string
  }
  room: {
    id: string
    name: string
    description: string
    dailyPrice: number
    maxPeople: number
  }
  totalPrice: number
}

export interface Reservation {
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

export function ReservationComponentTenant() {
  const [reservations, setReservation] = useState<Reservation[]>([])
  const [reservationHistory, setReservationHistory] = useState<
    ReservationHistory[]
  >([])
  const [dataLoaded, setDataLoaded] = useState(false)
  const [changeForm, setChangeForm] = useState(true)
  const auth = useContext(AuthContext)

  useEffect(() => {
    const getReservations = async () => {
      const response = await axios.get(`${BaseURL}/users/reservations`, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('authToken')}`,
          'ngrok-skip-browser-warning': 'true',
        },
      })
      if (response.status === 200) {
        setReservation(response.data)
        setDataLoaded(true)
      }
    }
    const getReservationHistory = async () => {
      setDataLoaded(false)
      const response = await axios.get(
        `${BaseURL}/users/reservations/historic`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 200) {
        setReservationHistory(response.data)
        setDataLoaded(true)
      }
    }
    getReservations()
    getReservationHistory()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <Container>
      <div className="title">
        <h1>
          <Link to={'/users/me'}>
            <FaArrowLeft id="backArrow" size={30} />
          </Link>{' '}
          Suas Reservas <span>({auth.user?.name})</span>
        </h1>
        <p>Gerencie aqui suas reservas</p>
      </div>
      <div className="reservationsContainer">
        <div className="buttons">
          <button
            onClick={() => {
              setChangeForm(true)
            }}
          >
            Reservas Pendentes
          </button>
          <button
            id="removebtn"
            onClick={() => {
              setChangeForm(false)
            }}
          >
            Histórico de Reservas
          </button>
        </div>
        {dataLoaded ? (
          <>
            {changeForm
              ? reservations.map((reservation) => (
                  <ReservationCardTenant
                    key={reservation.id}
                    reservation={reservation}
                  />
                ))
              : reservationHistory.map((reservationHistory) => (
                  <ReservationHistoryTenant
                    key={reservationHistory.id}
                    reservationHistory={reservationHistory}
                  />
                ))}
          </>
        ) : (
          <h2>Carregando dados...</h2>
        )}
      </div>
    </Container>
  )
}
