import { BecomeHostButton, HeaderContainer, InitialOptions } from './styles'

import logoHomeAway from '../../assets/logoHomeAway.png'
import hamburguerMenu from '../../assets/gg_menu.svg'
import userCircle from '../../assets/bx_bxs-user-circle.svg'

export function Header() {
  return (
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
            <li>Encontre um Imóvel</li>
            <li>Guias de Aluguel</li>
            <li>Favoritos</li>
          </ul>
        </nav>
      </div>

      <InitialOptions>
        <BecomeHostButton>Torne-se Parceiro</BecomeHostButton>
        <div className="initialCard">
          <img src={hamburguerMenu} alt="" />
          <img src={userCircle} width="40px" alt="" />
        </div>
      </InitialOptions>
    </HeaderContainer>
  )
}
