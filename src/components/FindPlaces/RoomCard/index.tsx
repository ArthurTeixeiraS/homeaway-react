import roomBackGround from '../../../assets/backgrounds/hotel-background.png'
import { Link } from 'react-router-dom'
import { HotelCard } from './styles'
import { Room } from '..'
import { FaLocationArrow, FaStar } from 'react-icons/fa'

type RoomCardProps = {
  room: Room
  filterData: {
    checkin: string
    checkout: string
    maxPeople: number
  }
}

export function RoomCardComponent({ room, filterData }: RoomCardProps) {
  return (
    <HotelCard>
      <Link
        to={`/room/${room.id}/${filterData.checkin}/${filterData.checkout}/${filterData.maxPeople}`}
      >
        {room.referenceImage && <img src={room.referenceImage} alt="" />}
        {!room.referenceImage && <img src={roomBackGround} alt="" />}
      </Link>
      <div className="infoContainer">
        <div className="infos">
          <h3>{room.name}</h3>
          <p>
            <FaLocationArrow id={'faLocation'} color={'#4086f4'} />
            {room.hotel.city}
          </p>
        </div>
        <div className="priceClassification">
          <p>
            <strong>R$ {room.dailyPrice}</strong> p/dia
            <strong>
              <p className="classification">
                Classificação:
                {room.classification === 0 ? (
                  <span>Sem Classificação</span>
                ) : (
                  <span>
                    <FaStar color={'#ffb60a'} />
                    {room.classification.toFixed(2)}
                  </span>
                )}
              </p>
            </strong>
          </p>
        </div>
      </div>
      <div className="buttons"></div>
    </HotelCard>
  )
}
