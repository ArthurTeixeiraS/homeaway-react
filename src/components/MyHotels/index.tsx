import { MyHotelsContainer } from './styles'
import hotelBackGround from '../../assets/backgrounds/hotel-background.png'

export function MyHotels() {
  return (
    <MyHotelsContainer>
      <div className="container">
        <div className="titleContainer">
          <h1>Seus Hotéis</h1>
        </div>
        <div className="hotelsContainer">
          <div className="hotelCard">
            <img src={hotelBackGround} alt="" />
            <div className="infoContainer">
              <h3>Nome do Hotel</h3>
              <p>Endereço do Hotel</p>
            </div>
            <div className="buttons">
              <a href="/users/myHotels/edit">
                <button type="button" className="edit">
                  Editar
                </button>
              </a>
              <button type="button" className="remove">
                Remover
              </button>
            </div>
          </div>
          <div className="hotelCard">
            <img src={hotelBackGround} alt="" />
            <div className="infoContainer">
              <h3>Nome do Hotel</h3>
              <p>Endereço do Hotel</p>
            </div>
            <div className="buttons">
              <a href="/users/myHotels/edit">
                <button type="button" className="edit">
                  Editar
                </button>
              </a>
              <button type="button" className="remove">
                Remover
              </button>
            </div>
          </div>
        </div>
      </div>
    </MyHotelsContainer>
  )
}
