import hotelBackGround from '../../../assets/backgrounds/hotel-background.png'
import { Link } from 'react-router-dom'
import { HotelCard } from './styles'
import { Hotel } from '../../../@types/Hotel'
import axios from 'axios'
import { BaseURL } from '../../../main'

type HotelCardProps = {
  hotel: Hotel
}

export function HotelCardComponent({ hotel }: HotelCardProps) {
  const handleRemove = async () => {
    const response = await axios.delete(`${BaseURL}/hotels/${hotel.id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem('authToken')}`,
        'ngrok-skip-browser-warning': 'true',
      },
    })
    if (response.status === 204) {
      window.location.reload()
      return response
    }
  }

  return (
    <HotelCard>
      <Link to={`/users/myHotels/${hotel.id}`}>
        {hotel.referenceImage && <img src={hotel.referenceImage} alt="" />}
        {!hotel.referenceImage && <img src={hotelBackGround} alt="" />}
        {/* {referenceImage && <img src={referenceImage} alt="" />} */}
      </Link>
      <div className="infoContainer">
        <h3>{hotel.name}</h3>
        <p>
          {hotel.street}, {hotel.number} em {hotel.city}
        </p>
      </div>
      <div className="buttons">
        <Link to={`/users/myHotels/edit/${hotel.id}`}>
          <button type="button" className="edit">
            Editar
          </button>
        </Link>
        <button type="button" className="remove" onClick={handleRemove}>
          Remover
        </button>
      </div>
    </HotelCard>
  )
}
