import roomBackGround from '../../../assets/backgrounds/hotel-background.png'
import { Link } from 'react-router-dom'
import { HotelCard } from './styles'
import { Room } from '..'

type RoomCardProps = {
  room: Room
}

export function HotelCardComponent({ room }: RoomCardProps) {
  return (
    <HotelCard>
      <Link to={`/users/myHotels/${room.id}`}>
        {room.referenceImage && <img src={roomBackGround} alt="" />}
        {!room.referenceImage && <img src={roomBackGround} alt="" />}
      </Link>
      <div className="infoContainer">
        <h3>{room.name}</h3>
        <p>R$</p>
      </div>
      <div className="buttons"></div>
    </HotelCard>
  )
}
