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
  roomImage: string
  hotelId: string
}

export function HotelsComponent() {
  const idHotel = crypto.randomUUID()
  const [roomData, setRoomData] = useState<RoomData[]>([])

  useEffect(() => {
    const fetchData = async () => {
      const response = await axios.get(`${BaseURL}/rooms`)
      const data: RoomData[] = await response.data
      setRoomData(data)
    }

    fetchData()
  }, [roomData])

  return (
    <Container>
      <TitleContainer>
        <h1>Aqui estão os dados do seu hotel...</h1>
        <Link to={`/users/myHotels/room/addRoom/${idHotel}`}>
          <button>Adicionar Quarto</button>
        </Link>
      </TitleContainer>
      <div className="cardContainer">
        {roomData.map((room) => (
          <RoomCard
            key={room.id}
            id={room.id}
            name={room.name}
            description={room.description}
            dailyPrice={room.dailyPrice}
            classification={room.classification}
            maxPeople={room.maxPeople}
            roomImage={room.roomImage}
            hotelId={room.hotelId}
          />
        ))}
      </div>
    </Container>
  )
}
