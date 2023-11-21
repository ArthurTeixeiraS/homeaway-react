import { Card } from './styles'
import backgroundHotel from '../../../assets/backgrounds/hotel-background.png'

interface RoomCardProps {
  id?: string
  name: string
  description: string
  dailyPrice: number
  classification: string
  maxPeople: number
  roomImage: File | null
  hotelId: string
}

export function RoomCard(props: RoomCardProps) {
  return (
    <Card>
      <div className="img">
        {!props.roomImage && <img src={backgroundHotel} alt="" />}
        {props.roomImage && <img src={String(props.roomImage)} alt="" />}
      </div>
      <div className="infos">
        <h1>{props.name}</h1>
        <h3 className="description">{props.description}</h3>
        <div className="secondaryInfos">
          <p className="dailyPrice">
            <strong>Daily Price:</strong> R${props.dailyPrice}
          </p>
          <p className="classification">
            <strong>Classification:</strong> {props.classification}
          </p>
          <p className="maxPeople">
            <strong>Max People:</strong> {props.maxPeople}
          </p>
        </div>
      </div>
    </Card>
  )
}
