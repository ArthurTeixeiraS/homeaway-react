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

const isHost: boolean = true

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
  if (!isHost) {
    return (
      <>
        <HeaderContainer>
          <nav className="menu-content">
            <div className="logo">
              <a href="/">
                <img src={logoHomeAway} alt="" width="70px" height="70px" />
                <h4>
                  Home<span>Away</span>
                </h4>
              </a>
            </div>

            <ul className="nav-links">
              <li>
                <a href="/findPlaces">Encontrar Imóvel</a>
              </li>
              <li>
                <a href="/rentGuide">Guia para aluguéis</a>
              </li>
              <li>
                <a href="/rentGuide">Baixe o App</a>
              </li>
            </ul>

            <InitialOptions>
              <BecomeHostButton>
                <a href="/singupPartner">Torne-se Parceiro</a>
              </BecomeHostButton>
              <div className="initialCard" onClick={abreFechaDropdown}>
                <img src={hamburguerMenu} alt="" />
                <img src={userCircle} width="40px" alt="" />
              </div>
              <div className="dropdown disabled">
                <ul className="dropdown-content">
                  <li>
                    <a href="/login">Entrar</a>
                  </li>
                  <li>
                    <a href="/singup">Cadastrar-se</a>
                  </li>
                </ul>
              </div>
            </InitialOptions>
          </nav>

          <SearchContainer>
            <div className="headers">
              <div className="title">
                <h1>
                  <a href="/roomRegister">Buscar</a>
                </h1>
              </div>
              <div className="links">
                <button>Apartamentos</button>
                <button>Hoteis</button>
                <button>Casas</button>
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

                <button type="submit">
                  <FaSearch color="white" size={15} />
                </button>
              </form>
            </div>
          </SearchContainer>
        </HeaderContainer>
      </>
    )
  } else {
    return (
      <>
        <HeaderContainer>
          <nav className="menu-content">
            <div className="logo">
              <a href="/">
                <img src={logoHomeAway} alt="" width="70px" height="70px" />
                <h4>
                  Home<span>Away</span>
                </h4>
              </a>
            </div>

            <ul className="nav-links">
              <li>
                <a href="/findPlaces">Encontrar Imóvel</a>
              </li>
              <li>
                <a href="/rentGuide">Guia para aluguéis</a>
              </li>
              <li>
                <a href="/rentGuide">Baixe o App</a>
              </li>
            </ul>

            <InitialOptions>
              <BecomeHostButton>
                <a href="/addRoom">Adicione imóveis</a>
              </BecomeHostButton>
              <div className="initialCard" onClick={abreFechaDropdown}>
                <img src={hamburguerMenu} alt="" />
                <img src={userCircle} width="40px" alt="" />
              </div>
              <div className="dropdown disabled">
                <ul className="dropdown-content">
                  <li>
                    <a href="/login">Entrar</a>
                  </li>
                  <li>
                    <a href="/singup">Cadastrar-se</a>
                  </li>
                </ul>
              </div>
            </InitialOptions>
          </nav>

          <SearchContainer>
            <div className="headers">
              <div className="title">
                <h1>
                  <a href="/roomRegister">Buscar</a>
                </h1>
              </div>
              <div className="links">
                <button>Apartamentos</button>
                <button>Hoteis</button>
                <button>Casas</button>
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

                <button type="submit">
                  <FaSearch color="white" size={15} />
                </button>
              </form>
            </div>
          </SearchContainer>
        </HeaderContainer>
      </>
    )
  }
}
