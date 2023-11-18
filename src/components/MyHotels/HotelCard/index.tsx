import hotelBackGround from '../../../assets/backgrounds/hotel-background.png'
import { Link } from 'react-router-dom'
import { HotelCard } from './styles'

export function HotelCardComponent() {
  const objeto = {
    id: crypto.randomUUID(),
  }
  return (
    <HotelCard>
      <Link to={`/users/myHotels/${objeto.id}`}>
        <img src={hotelBackGround} alt="" />
      </Link>
      <div className="infoContainer">
        <h3>Nome do Hotel</h3>
        <p>Endereço do Hotel</p>
      </div>
      <div className="buttons">
        <Link to={`/users/myHotels/edit/${objeto.id}`}>
          <button type="button" className="edit">
            Editar
          </button>
        </Link>
        <button type="button" className="remove">
          Remover
        </button>
      </div>
    </HotelCard>
  )
}
