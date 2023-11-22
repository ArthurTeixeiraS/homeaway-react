import { Card } from './styles'
import backgroundHotel from '../../../assets/backgrounds/hotel-background.png'
import { Link } from 'react-router-dom'

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
      <div className="information">
        <div className="img">
          {!props.roomImage && <img src={backgroundHotel} alt="" />}
          {props.roomImage && <img src={String(props.roomImage)} alt="" />}
        </div>
        <div className="infos">
          <h1>{props.name}</h1>
          <h3 className="description">{props.description}</h3>
          <div className="secondaryInfos">
            <p className="dailyPrice">
              <strong>Diária: </strong> R${props.dailyPrice}
            </p>
            <p className="classification">
              <strong>Classificação:</strong>
              {props.classification
                ? props.classification
                : 'Sem classificação'}
            </p>
            <p className="maxPeople">
              <strong>Espaço</strong> {props.maxPeople} pessoas.
            </p>
          </div>
        </div>
      </div>
      <div className="buttons">
        <Link to={`/users/myHotels/room/edit/${props.id}`}>
          <button>Editar</button>
        </Link>
        <button className="remove">Remover</button>
      </div>
    </Card>
  )
}
