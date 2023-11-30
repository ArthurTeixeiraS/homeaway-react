import { Card } from './styles'
import backgroundHotel from '../../../assets/backgrounds/hotel-background.png'
import { Link } from 'react-router-dom'
import axios from 'axios'
import { FormEvent } from 'react'
import { BaseURL } from '../../../main'

interface RoomCardProps {
  id?: string
  name: string
  description: string
  dailyPrice: number
  classification: number
  maxPeople: number
  referenceImage: string
  hotelId: string
}

export function RoomCard(props: RoomCardProps) {
  const idRoom = props.id
  const handleRemove = async (event: FormEvent) => {
    event.preventDefault()
    try {
      const response = await axios.delete(`${BaseURL}/rooms/${idRoom}`, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('authToken')}`,
          'ngrok-skip-browser-warning': 'true',
        },
      })

      if (response.status === 204) {
        window.location.reload()
        return response
      }
    } catch (e) {
      console.error('Falha na requisição:', e)
    }
  }

  return (
    <Card>
      <div className="information">
        <div className="img">
          {!props.referenceImage && <img src={backgroundHotel} alt="" />}
          {props.referenceImage && <img src={props.referenceImage} alt="" />}
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
                ? props.classification.toFixed(2)
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
        <button className="remove" onClick={(e) => handleRemove(e)}>
          Remover
        </button>
      </div>
    </Card>
  )
}
