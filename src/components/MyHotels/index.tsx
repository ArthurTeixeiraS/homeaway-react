import { MyHotelsContainer } from './styles'
import { HotelCardComponent } from './HotelCard'
import { useContext, useEffect, useState } from 'react'
import { AuthContext } from '../../contexts/Auth/AuthContext'
import { UseAPI } from '../../hooks/useApi'
import { Hotel } from '../../@types/Hotel'

export function MyHotels() {
  const auth = useContext(AuthContext)
  const api = UseAPI()
  const [hotels, setHotels] = useState<Hotel[]>([])
  const [dataLoaded, setDataLoaded] = useState(false)

  useEffect(() => {
    const hotelsGet = async () => {
      try {
        const response = await api.findHotels(
          localStorage.getItem('authToken')!,
        )
        setHotels(response)
        setDataLoaded(true)
      } catch (error) {
        console.error('Erro ao obter hotéis:', error)
        setDataLoaded(false)
      }
    }
    hotelsGet()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <MyHotelsContainer>
      {dataLoaded ? (
        <div className="container">
          <div className="titleContainer">
            <h1>
              Seus Hotéis <span>({auth.user?.name})</span>
            </h1>
          </div>
          <div className="hotelsContainer">
            {hotels.length > 0 ? (
              hotels.map((hotel) => (
                <HotelCardComponent key={hotel.id} hotel={hotel} />
              ))
            ) : (
              <h2>Não há hoteis registrados!</h2>
            )}
          </div>
        </div>
      ) : (
        <h1>Carregando dados...</h1>
      )}
    </MyHotelsContainer>
  )
}
