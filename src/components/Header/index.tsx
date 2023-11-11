/* eslint-disable no-constant-condition */
import { BecomeHostButton, HeaderContainer, InitialOptions } from './styles'

import logoHomeAway from '../../assets/logoHomeAway.png'
import hamburguerMenu from '../../assets/gg_menu.svg'
import userCircle from '../../assets/bx_bxs-user-circle.svg'

const isHost: boolean = true

function abreFechaDropdown() {
  const drop = document.querySelector('.dropdown')
  if (drop?.classList.contains('disabled')) {
    drop.classList.remove('disabled')
  } else {
    drop?.classList.add('disabled')
  }
}
export function Header() {
  if (!isHost) {
    return (
      <>
        <HeaderContainer>
          <div className="logo">
            <h1>
              <a href="/" className="logoName">
                <img src={logoHomeAway} width={70} height={70} alt="" />
                Home<span>Away</span>
              </a>
            </h1>
          </div>

          <div className="middleOptions">
            <nav>
              <ul>
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
            </nav>
          </div>

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
        </HeaderContainer>
      </>
    )
  } else {
    return (
      <>
        <HeaderContainer>
          <div className="logo">
            <h1>
              <a href="/" className="logoName">
                <img src={logoHomeAway} width={70} height={70} alt="" />
                Home<span>Away</span>
              </a>
            </h1>
          </div>

          <div className="middleOptions">
            <nav>
              <ul>
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
            </nav>
          </div>

          <InitialOptions>
            <BecomeHostButton>
              <a href="/addHotel">Adicione Imóveis</a>
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
        </HeaderContainer>
      </>
    )
  }
}
