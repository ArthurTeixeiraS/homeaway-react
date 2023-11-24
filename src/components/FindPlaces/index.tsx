import { useContext, useEffect, useState } from 'react'
import { UseAPI } from '../../hooks/useApi'
import { FiltersNav } from './FiltersNav'
import { HotelCardComponent } from './HotelCard'
import { FindPlacesContainer } from './styles'
import { AuthContext } from '../../contexts/Auth/AuthContext'

export type Room = {
  id: string
  name: string
  description: string
  dailyPrice: number
  maxPeople: number
  hotelId: string
  referenceImage: string
}

export function FindPlaces() {
  const auth = useContext(AuthContext)
  const api = UseAPI()
  const [rooms, setRooms] = useState<Room[]>([])

  const [dataLoaded, setDataLoaded] = useState(false)

  useEffect(() => {
    const roomsGet = async () => {
      try {
        const response = await api.findRooms(localStorage.getItem('authToken')!)
        setRooms(response)
        setDataLoaded(true)
      } catch (err) {
        console.log('Erro ao obter Quartos', err)
        setDataLoaded(false)
      }
    }
    roomsGet()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <FindPlacesContainer>
      <FiltersNav />
      {dataLoaded ? (
        <div className="container">
          <div className="titleContainer">
            <h1>
              Hotéis disponiveis
              {auth.user && <span>({auth.user?.name})</span>}
            </h1>
          </div>
          <div className="roomsContainer">
            {rooms.length > 0 ? (
              rooms.map((room) => (
                <HotelCardComponent key={room.id} room={room} />
              ))
            ) : (
              <h2>Não foi possível encontrar quartos</h2>
            )}
          </div>
        </div>
      ) : (
        <h2>Carregando dados...</h2>
      )}
    </FindPlacesContainer>
  )
}
