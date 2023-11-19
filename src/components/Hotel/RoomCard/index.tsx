import { Card } from './styles'

interface RoomCardProps {
  id?: string
  name: string
  description: string
  dailyPrice: number
  classification: string
  maxPeople: number
  roomImage: string
  hotelId: string
}

export function RoomCard(props: RoomCardProps) {
  const {
    name,
    description,
    dailyPrice,
    classification,
    maxPeople,
    roomImage,
    hotelId,
  } = props

  return (
    <Card>
      <div className="img">
        <img src={roomImage} alt={name} />
      </div>
      <div className="infos">
        <h2>{name}</h2>
        <p>{description}</p>
        <p>Daily Price: {dailyPrice}</p>
        <p>Classification: {classification}</p>
        <p>Max People: {maxPeople}</p>
        <p>Hotel ID: {hotelId}</p>
      </div>
    </Card>
  )
}
