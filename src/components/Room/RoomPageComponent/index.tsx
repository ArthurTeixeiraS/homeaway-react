import { useEffect, useState } from 'react'
import { Container } from './styles'
import axios from 'axios'
import { BaseURL } from '../../../main'
import { FaLocationArrow, FaStar, FaBed, FaDog, FaWifi } from 'react-icons/fa'
import hostIcon from '../../../assets/UserIconHost.png'

export function RoomPageComponent() {
  const roomId = window.location.href.split('/')[4]

  const [dataLoaded, setDataLoaded] = useState(false)

  const [roomData, setRoomData] = useState({
    id: '',
    name: '',
    description: '',
    dailyPrice: 0,
    maxPeople: 0,
    referenceImage: '',
    classification: 0,
    hotel: {
      id: '',
      classification: 0,
      name: '',
      description: '',
      uf: '',
      city: '',
      neighbourhood: '',
      street: '',
      number: '',
      allowsPets: false,
      hasWifi: false,
      hasRoomService: false,
      referenceImage: '',
      user: {
        name: '',
        email: '',
      },
    },
  })

  useEffect(() => {
    const getRoomData = async () => {
      try {
        const response = await axios.get(`${BaseURL}/rooms/${roomId}`, {
          headers: {
            'ngrok-skip-browser-warning': 'true',
          },
        })
        if (response.status === 200) {
          setRoomData(response.data)
          setDataLoaded(true)
        } else {
          setDataLoaded(false)
        }
      } catch (err) {
        console.error('Erro ao carregar Quarto', err)
      }
    }
    getRoomData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  /*   const auth = useContext(AuthContext) */

  const [reservation] = useState({
    roomId,
    checkIn: window.location.href.split('/')[5],
    checkOut: window.location.href.split('/')[6],
    maxPeople: window.location.href.split('/')[7],
  })

  const handleReservation = async () => {
    console.log(reservation)
    try {
      const response = await axios.post(
        `${BaseURL}/reservations`,
        reservation,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 200) {
        console.log('Reserva Concluída', response.data)
        alert('Reserva concluída, verifique a pagina de reservas')
      }
    } catch (e) {
      console.error('Erro na realização da reserva:', e)
    }
  }

  return (
    <>
      <Container>
        {dataLoaded ? (
          <>
            <div className="mainContent">
              <div className="image">
                <img src={roomData.referenceImage} alt="" />
              </div>
              <div className="content">
                <div className="title">
                  <h1>{roomData.name}</h1>
                  <h3>
                    pertence ao hotel: <span>{roomData.hotel.name}</span>
                  </h3>
                </div>
                <div className="location">
                  <h2>
                    <FaLocationArrow color={'#4086f4'} /> Na rua{' '}
                    {roomData.hotel.street}, {roomData.hotel.neighbourhood}{' '}
                    <br />
                    em {roomData.hotel.city}, {roomData.hotel.uf}
                  </h2>
                </div>
                <div className="price">
                  <h3>A partir de:</h3>
                  <h1>
                    R$ {roomData.dailyPrice} <span>p/ dia</span>
                  </h1>
                </div>
                <div className="feedback">
                  {roomData.classification !== 0 ? (
                    <h3>
                      Os usuários avaliam esse quarto com{' '}
                      {roomData.classification}
                      <FaStar color={'#ffb60a'} />
                    </h3>
                  ) : (
                    <h3>Sem classificação</h3>
                  )}
                </div>
                <div className="reserveNow">
                  <button onClick={handleReservation}>Alugar agora</button>
                  <p>
                    Você será redirecionado para fazer o pagamento via Stripe.
                  </p>
                </div>
              </div>
            </div>
            <div className="infoBlocs">
              <div className="roomblock">
                <FaBed size={50} color={'#ffb60a'} />
                <h2>{roomData.maxPeople} Visitantes</h2>
              </div>
              <div className="allowPets">
                <FaDog size={50} color={'#ffb60a'} />
                {roomData.hotel.allowsPets ? (
                  <h2>Permite Pets</h2>
                ) : (
                  <h2>
                    Não permite <br /> Pets
                  </h2>
                )}
              </div>
              <div className="hasWifi">
                <FaWifi size={50} color={'#ffb60a'} />
                {roomData.hotel.hasWifi ? (
                  <h2>
                    Possui acesso a <br />
                    Wi-Fi
                  </h2>
                ) : (
                  <h2>
                    Não possui acesso
                    <br /> a Wi-Fi
                  </h2>
                )}
              </div>
              <div className="hostInfos">
                <h2 className="title">Listado por:</h2>
                <div className="hostInfoContent">
                  <img src={hostIcon} alt="" />
                  <div className="infos">
                    <h2>{roomData.hotel.user.name}</h2>
                    <p>{roomData.hotel.user.email}</p>
                  </div>
                </div>
              </div>
            </div>
            <div className="descAndHotel">
              <div className="description">
                <h1>Descrição</h1>
                <p>
                  <strong>{roomData.name}</strong>
                </p>
                <p>{roomData.description}</p>
              </div>
              <div className="hotelInfo">
                <img src={roomData.hotel.referenceImage} alt="" />
                <div className="infos">
                  <h2>Pertence ao hotel:</h2>
                  <h2>{roomData.hotel.name}</h2>
                  {roomData.hotel.classification !== 0 ? (
                    <h3>
                      Os usuários avaliam esse quarto com{' '}
                      {roomData.hotel.classification}
                      <FaStar color={'#ffb60a'} />
                    </h3>
                  ) : (
                    <h3>Sem Classificação</h3>
                  )}
                  <h4>
                    {roomData.hotel.street}, {roomData.hotel.number} ,{' '}
                    {roomData.hotel.neighbourhood}, <br /> {roomData.hotel.city}
                    , {roomData.hotel.uf}
                  </h4>
                </div>
              </div>
            </div>
          </>
        ) : (
          <h2 className="loading">Carregando Conteúdo...</h2>
        )}
      </Container>
    </>
  )
}
