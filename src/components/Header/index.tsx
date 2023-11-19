import { BecomeHostButton, HeaderContainer, InitialOptions } from './styles'

import logoHomeAway from '../../assets/logoHomeAway.png'
import hamburguerMenu from '../../assets/gg_menu.svg'
import userCircle from '../../assets/bx_bxs-user-circle.svg'
import { Link, useNavigate } from 'react-router-dom'
import { useContext } from 'react'
import { AuthContext } from '../../contexts/Auth/AuthContext'

function abreFechaDropdown() {
  const drop = document.querySelector('.dropdown')
  if (drop?.classList.contains('disabled')) {
    drop.classList.remove('disabled')
  } else {
    drop?.classList.add('disabled')
  }
}
export function Header() {
  const navigate = useNavigate()

  const handleLogout = async () => {
    await auth.singout()
    navigate('/')
  }
  const auth = useContext(AuthContext)
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
                <Link to="/rentalGuides">Guia para aluguéis</Link>
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
              {auth.user && (
                <li>
                  <Link to="javascript:;" onClick={handleLogout}>
                    Sair
                  </Link>
                </li>
              )}
            </ul>
          </div>
        </InitialOptions>
      </HeaderContainer>
    </>
  )
}
