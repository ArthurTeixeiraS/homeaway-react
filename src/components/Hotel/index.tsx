import { Link } from 'react-router-dom'
import { Container, TitleContainer } from './styles'
import { RoomCard } from './RoomCard' // Importa o componente RoomCard
import { useEffect, useState } from 'react'
import { BaseURL } from '../../main'
import axios from 'axios'

interface RoomData {
  id: string
  name: string
  description: string
  dailyPrice: number
  classification: string
  maxPeople: number
  roomImage: File | null
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
        console.log(roomData)
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
            <h1>Aqui estão os dados do seu hotel...</h1>
            <Link to={`/users/myHotels/room/addRoom/${hotelId}`}>
              <button>Adicionar Quarto</button>
            </Link>
          </TitleContainer>
          <div className="cardContainer">
            {Array.isArray(roomData) && roomData.length > 0 ? (
              roomData.map((room) => (
                <RoomCard
                  key={room.id}
                  name={room.name}
                  description={room.description}
                  dailyPrice={room.dailyPrice}
                  classification={room.classification}
                  maxPeople={room.maxPeople}
                  roomImage={room.roomImage}
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
