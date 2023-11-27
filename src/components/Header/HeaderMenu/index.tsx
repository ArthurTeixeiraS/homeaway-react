import {
  BecomeHostButton,
  HeaderContainer,
  InitialOptions,
  SearchContainer,
} from './styles'

import logoHomeAway from '../../../assets/logoHomeAway.png'
import hamburguerMenu from '../../../assets/gg_menu.svg'
import userCircle from '../../../assets/bx_bxs-user-circle.svg'
import { FaSearch } from 'react-icons/fa'
import { Link, useNavigate } from 'react-router-dom'
import { useContext, useState } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'

function verificaData() {
  const hoje = new Date().toISOString().slice(0, 10)
  return hoje
}

function abreFechaDropdown() {
  const drop = document.querySelector('.dropdown')
  if (drop?.classList.contains('disabled')) {
    drop.classList.remove('disabled')
  } else {
    drop?.classList.add('disabled')
  }
}

export function MainMenuHeader() {
  const auth = useContext(AuthContext)
  const navigate = useNavigate()

  const [selectedCheckInDate, setSelectedCheckInDate] = useState<string>(
    verificaData(),
  )

  const handleCheckInDateChange = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    setSelectedCheckInDate(event.target.value)
  }

  const handleLogout = async () => {
    await auth.singout()
    navigate('/')
  }

  return (
    <>
      <HeaderContainer>
        <nav className="menu-content">
          <div className="logo">
            <Link to="/">
              <img src={logoHomeAway} alt="" width="70px" height="70px" />
              <h4>
                Home<span>Away</span>
              </h4>
            </Link>
          </div>

          {auth.user?.role !== 'HOST' && (
            <ul className="nav-links">
              {/* <li>
                <Link to="/findPlaces">Encontrar Imóvel</Link>
              </li> */}
              <li>
                <Link to="/rentalGuides">Guia para aluguéis</Link>
              </li>
            </ul>
          )}

          <InitialOptions>
            {auth.user?.role === 'HOST' ? (
              <BecomeHostButton>
                <Link to="/rentalGuides">Dicas para anúnciar</Link>
              </BecomeHostButton>
            ) : (
              <BecomeHostButton>
                <Link to="/singupPartner">Torne-se Parceiro</Link>
              </BecomeHostButton>
            )}
            <div className="initialCard" onClick={abreFechaDropdown}>
              <img src={hamburguerMenu} alt="" />
              <img src={userCircle} width="40px" alt="" />
            </div>
            <div className="dropdown disabled">
              <ul className="dropdown-content">
                {!auth.user && (
                  <>
                    <li>
                      <Link to="/login">Entrar</Link>
                    </li>
                    <li>
                      <Link to="/singup">Cadastrar-se</Link>
                    </li>
                  </>
                )}
                {auth.user && auth.user.role === 'HOST' && (
                  <>
                    <li className="host">
                      <Link to="users/myHotels">Meus hotéis</Link>
                    </li>
                    <li className="host">
                      <Link to="users/me">Perfil</Link>
                    </li>
                    <li className="host">
                      <button onClick={handleLogout}>Sair</button>
                    </li>
                  </>
                )}
                {auth.user && auth.user.role === 'TENANT' && (
                  <>
                    <li>
                      <Link to="users/client/reservations">Reservas</Link>
                    </li>
                    <li>
                      <Link to="users/me">Perfil</Link>
                    </li>
                    <li>
                      <button onClick={handleLogout}>Sair</button>
                    </li>
                  </>
                )}
              </ul>
            </div>
          </InitialOptions>
        </nav>

        <SearchContainer>
          <div className="headers">
            {auth.user?.role === 'TENANT' || !auth.user ? (
              <div className="title">
                <h1>Buscar</h1>
              </div>
            ) : (
              <div className="titleHost">
                <h1>
                  <span>Começe a </span>hospedar!
                </h1>
              </div>
            )}
          </div>
          <div className="search-box">
            {auth.user?.role === 'TENANT' || !auth.user ? (
              <form action="/findPlaces" method="get">
                <div className="location-input">
                  <label htmlFor="location">Indo para:</label>
                  <input
                    type="text"
                    name="location"
                    id="location"
                    placeholder="Que cidade você prefere?"
                    required
                  />
                </div>
                <div className="checkin-input">
                  <label htmlFor="checkin">Check-In</label>
                  <input
                    type="date"
                    name="checkin"
                    id="checkin"
                    min={verificaData()}
                    value={selectedCheckInDate}
                    onChange={handleCheckInDateChange}
                    required
                  />
                </div>
                <div className="checkout-input">
                  <label htmlFor="checkout">Check-Out</label>
                  <input
                    type="date"
                    name="checkout"
                    id="checkout"
                    min={selectedCheckInDate}
                    required
                  />
                </div>
                <div className="location-input">
                  <label htmlFor="location">Visitantes</label>
                  <input
                    type="number"
                    name="maxPeople"
                    id="maxPeople"
                    placeholder="Quartos"
                    required
                  />
                </div>

                <button type="submit">
                  <FaSearch color="white" size={15} />
                </button>
              </form>
            ) : (
              <div className="buttonForStart">
                <Link to={'/users/addHotel'}>
                  <BecomeHostButton>
                    Começe adicionando um hotel!
                  </BecomeHostButton>
                </Link>
              </div>
            )}
          </div>
        </SearchContainer>
      </HeaderContainer>
    </>
  )
}
