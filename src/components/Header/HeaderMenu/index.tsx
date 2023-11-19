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
import { Link } from 'react-router-dom'

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

          <ul className="nav-links">
            <li>
              <Link to="/findPlaces">Encontrar Imóvel</Link>
            </li>
            <li>
              <Link to="/rentalGuides">Guia para aluguéis</Link>
            </li>
          </ul>

          <InitialOptions>
            <BecomeHostButton>
              <Link to="/singupPartner">Torne-se Parceiro</Link>
            </BecomeHostButton>
            <div className="initialCard" onClick={abreFechaDropdown}>
              <img src={hamburguerMenu} alt="" />
              <img src={userCircle} width="40px" alt="" />
            </div>
            <div className="dropdown disabled">
              <ul className="dropdown-content">
                <li>
                  <Link to="/login">Entrar</Link>
                </li>
                <li>
                  <Link to="/singup">Cadastrar-se</Link>
                </li>
              </ul>
            </div>
          </InitialOptions>
        </nav>

        <SearchContainer>
          <div className="headers">
            <div className="title">
              <h1>Buscar</h1>
            </div>
          </div>
          <div className="search-box">
            <form action="" method="get">
              <div className="location-input">
                <label htmlFor="location">Indo para:</label>
                <input
                  type="text"
                  name="location"
                  id="location"
                  placeholder="Que cidade você prefere?"
                />
              </div>
              <div className="checkin-input">
                <label htmlFor="checkin">Check-In</label>
                <input
                  type="date"
                  name="checkin"
                  id="checkin"
                  min={verificaData()}
                />
              </div>
              <div className="checkout-input">
                <label htmlFor="checkout">Check-Out</label>
                <input
                  type="date"
                  name="checkout"
                  id="checkout"
                  min={verificaData()}
                />
              </div>
              <div className="location-input">
                <label htmlFor="location">Indo para:</label>
                <input
                  type="number"
                  name="maxPeople"
                  id="maxPeople"
                  placeholder="Quartos"
                />
              </div>

              <Link to="/">
                <button type="button">
                  <FaSearch color="white" size={15} />
                </button>
              </Link>
            </form>
          </div>
        </SearchContainer>
      </HeaderContainer>
    </>
  )
}
