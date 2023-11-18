import { MyHotelsContainer } from './styles'
import { HotelCardComponent } from './HotelCard'

export function MyHotels() {
  return (
    <MyHotelsContainer>
      <div className="container">
        <div className="titleContainer">
          <h1>Seus Hotéis</h1>
        </div>
        <div className="hotelsContainer">
          <HotelCardComponent />
          <HotelCardComponent />
          <HotelCardComponent />
        </div>
      </div>
    </MyHotelsContainer>
  )
}
