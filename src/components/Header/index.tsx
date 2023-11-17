import { BecomeHostButton, HeaderContainer, InitialOptions } from './styles'

import logoHomeAway from '../../assets/logoHomeAway.png'
import hamburguerMenu from '../../assets/gg_menu.svg'
import userCircle from '../../assets/bx_bxs-user-circle.svg'
import { isLogged, isHost } from '../../App'
import { Link } from 'react-router-dom'

function abreFechaDropdown() {
  const drop = document.querySelector('.dropdown')
  if (drop?.classList.contains('disabled')) {
    drop.classList.remove('disabled')
  } else {
    drop?.classList.add('disabled')
  }
}
export function Header() {
  if (!isLogged) {
    return (
      <>
        <HeaderContainer>
          <div className="logo">
            <h1>
              <Link to="/" className="logoName">
                <img src={logoHomeAway} width={70} height={70} alt="" />
                Home<span>Away</span>
              </Link>
            </h1>
          </div>

          <div className="middleOptions">
            <nav>
              <ul>
                <li>
                  <Link to="/singup">Encontrar Imóvel</Link>
                </li>
                <li>
                  <Link to="/singup">Guia para aluguéis</Link>
                </li>
              </ul>
            </nav>
          </div>

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
        </HeaderContainer>
      </>
    )
  } else if (isLogged && isHost) {
    return (
      <>
        <HeaderContainer>
          <div className="logo">
            <h1>
              <Link to="/" className="logoName">
                <img src={logoHomeAway} width={70} height={70} alt="" />
                Home<span>Away</span>
              </Link>
            </h1>
          </div>

          <InitialOptions>
            <BecomeHostButton>
              <Link to="/addHotel">Adicione Hotéis</Link>
            </BecomeHostButton>
            <div className="initialCard" onClick={abreFechaDropdown}>
              <img src={hamburguerMenu} alt="" />
              <img src={userCircle} width="40px" alt="" />
            </div>
            <div className="dropdown disabled">
              <ul className="dropdown-content">
                <li>
                  <Link to="/singup">Adicionar Hotéis</Link>
                </li>
                <li>
                  <Link to="/singup">Meus Hotéis</Link>
                </li>
                <li>
                  <Link to="/login">Sair</Link>
                </li>
              </ul>
            </div>
          </InitialOptions>
        </HeaderContainer>
      </>
    )
  } else if (isLogged && !isHost) {
    return (
      <>
        <HeaderContainer>
          <div className="logo">
            <h1>
              <Link to="/" className="logoName">
                <img src={logoHomeAway} width={70} height={70} alt="" />
                Home<span>Away</span>
              </Link>
            </h1>
          </div>

          <div className="middleOptions">
            <nav>
              <ul>
                <li>
                  <Link to="/findPlaces">Encontrar Imóvel</Link>
                </li>
                <li>
                  <Link to="/rentGuides">Guia para aluguéis</Link>
                </li>
              </ul>
            </nav>
          </div>

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
                  <Link to="/login">Sair</Link>
                </li>
              </ul>
            </div>
          </InitialOptions>
        </HeaderContainer>
      </>
    )
  }
}
