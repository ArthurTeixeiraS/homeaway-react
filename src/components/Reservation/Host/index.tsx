import { Link } from 'react-router-dom'
import { Container } from './styles'
import { FaArrowLeft } from 'react-icons/fa'
import { useContext, useEffect, useState } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'
import axios from 'axios'
import { BaseURL } from '../../../main'
import { ReservationCard } from './ReservationCard'
import { ReservationHistory } from './ReservationHistory'

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
    email: string
    id: string
    name: string
  }
}

export interface ReservationHistory {
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
}

export function ReservationComponentHost() {
  const [reservations, setReservations] = useState<Reservation[]>([])
  const [reservationsHistory, setReservationsHistory] = useState<
    ReservationHistory[]
  >([])
  const [dataLoaded, setDataLoaded] = useState(false)
  const [changeForm, setChangeForm] = useState(true)
  const auth = useContext(AuthContext)

  const hotelId = window.location.href.split('/')[6]
  useEffect(() => {
    const getReservations = async () => {
      const response = await axios.get(
        `${BaseURL}/hotels/${hotelId}/reservations`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 200) {
        setReservations(response.data)
        setDataLoaded(true)
      }
    }
    const getReservationsHistory = async () => {
      setDataLoaded(false)
      const response = await axios.get(
        `${BaseURL}/hotels/${hotelId}/reservations/historic`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 200) {
        setReservationsHistory(response.data)
        setDataLoaded(true)
      }
    }
    getReservations()
    getReservationsHistory()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <Container>
      <div className="title">
        <h1>
          <Link to={'/users/me'}>
            <FaArrowLeft id="backArrow" size={30} />
          </Link>{' '}
          Suas reservas <span>({auth.user?.name})</span>
        </h1>
        <p>Gerencie os seus pedidos de reservas, feitos por outros usuários</p>
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
            Histórico de reservas
          </button>
        </div>
        {dataLoaded ? (
          <>
            {changeForm
              ? reservations.map((reservation) => (
                  <ReservationCard
                    key={reservation.id}
                    reservation={reservation}
                  />
                ))
              : reservationsHistory.map((reservationHistory) => (
                  <ReservationHistory
                    key={reservationHistory.id}
                    reservationHistory={reservationHistory}
                  />
                ))}
          </>
        ) : (
          <h1>Carregando dados...</h1>
        )}
      </div>
    </Container>
  )
}
