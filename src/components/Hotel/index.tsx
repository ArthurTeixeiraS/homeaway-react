import { Link } from 'react-router-dom'
import { Container, TitleContainer } from './styles'
import { RoomCard } from './RoomCard' // Importa o componente RoomCard
import { useEffect, useState } from 'react'
import { BaseURL } from '../../main'
import axios from 'axios'
import { FaArrowLeft } from 'react-icons/fa'

interface RoomData {
  id: string
  name: string
  description: string
  dailyPrice: number
  classification: string
  maxPeople: number
  referenceImage: string
  hotelId: string
}

export function HotelsComponent() {
  const hotelId = window.location.href.split('/')[5]
  const [roomData, setRoomData] = useState<RoomData[]>([])
  const [dataLoaded, setDataLoaded] = useState(false)

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`${BaseURL}/rooms/hotels/${hotelId}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        })
        const data = await response.data
        setRoomData(data)
        setDataLoaded(true)
      } catch (err) {
        setDataLoaded(false)
      }
    }

    fetchData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <Container>
      {dataLoaded ? (
        <>
          <TitleContainer>
            <h1>
              <div className="arrow">
                <Link to="/users/myHotels">
                  <FaArrowLeft />
                </Link>
              </div>
              Aqui estão os dados do seu hotel...
            </h1>
            <div className="buttons">
              <Link
                className="reserv"
                to={`/users/host/reservations/${hotelId}`}
              >
                <button>Gerenciar reservas</button>
              </Link>
              <Link to={`/users/myHotels/room/addRoom/${hotelId}`}>
                <button>Adicionar Quarto</button>
              </Link>
            </div>
          </TitleContainer>
          <div className="cardContainer">
            {Array.isArray(roomData) && roomData.length > 0 ? (
              roomData.map((room) => (
                <RoomCard
                  key={room.id}
                  id={room.id}
                  name={room.name}
                  description={room.description}
                  dailyPrice={room.dailyPrice}
                  classification={room.classification}
                  maxPeople={room.maxPeople}
                  referenceImage={room.referenceImage}
                  hotelId={room.hotelId}
                />
              ))
            ) : (
              <h2>Nenhum quarto disponível.</h2>
            )}
          </div>
        </>
      ) : (
        <h1>Carregando dados...</h1>
      )}
    </Container>
  )
}
