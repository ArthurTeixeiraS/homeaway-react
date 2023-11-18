import hotelImage from '../../../assets/backgrounds/house-3.png'
import { Card } from './styles'

export function HotelCard() {
  return (
    <Card>
      <div className="img">
        <img src={hotelImage} alt="" />
      </div>
    </Card>
  )
}
