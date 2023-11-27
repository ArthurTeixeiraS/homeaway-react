/* eslint-disable @typescript-eslint/no-unused-vars */
import { useEffect, useState } from 'react'
import { UseAPI } from '../../hooks/useApi'
import { FindPlacesContainer } from './styles'
import { RoomCardComponent } from './RoomCard'

export type Room = {
  id: string
  classification: number
  name: string
  description: string
  dailyPrice: number
  maxPeople: number
  hotelId: string
  referenceImage: string
  hotel: {
    id: string
    name: string
    description: string
    uf: string
    city: string
    neighbourhood: string
    street: string
    number: string
    allowPets: boolean
    hasWifi: boolean
    hasRoomService: boolean
    referenceImage: string
  }
}

export function FindPlaces() {
  const api = UseAPI()
  const filtroDefault = {
    location: window.location.href.split('=')[1].split('&')[0],
    checkin: window.location.href.split('=')[2].split('&')[0],
    checkout: window.location.href.split('=')[3].split('&')[0],
    maxPeople: Number(window.location.href.split('=')[4].split('&')[0]),
  }
  const [dataLoaded, setDataLoaded] = useState(false)
  const [rooms, setRooms] = useState<Room[]>([])

  useEffect(() => {
    const getRoomData = async () => {
      try {
        const response = await api.findRooms(
          filtroDefault.location,
          filtroDefault.checkin,
          filtroDefault.checkout,
          filtroDefault.maxPeople,
        )

        if (response.status === 200) {
          setRooms(response.data.content)
          setDataLoaded(true)
        }
      } catch (err) {
        console.error('Erro ao enviar pesquisa', err)
        setDataLoaded(false)
      }
    }

    getRoomData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])
  return (
    <FindPlacesContainer>
      <div className="container">
        {dataLoaded ? (
          <>
            <div className="titleContainer">
              <h1>Quartos disponíveis</h1>
              <p>com base no que você buscou</p>
            </div>
            <div className="roomsContainer">
              {rooms.map((room) => (
                <RoomCardComponent
                  key={room.id}
                  room={room}
                  filterData={filtroDefault}
                />
              ))}
            </div>
          </>
        ) : (
          <h1>Buscando Quartos...</h1>
        )}
      </div>
    </FindPlacesContainer>
  )
}
