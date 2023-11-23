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
          {auth.user?.role !== 'HOST' && (
            <ul className="nav-links">
              <li>
                <Link to="/findPlaces">Encontrar Imóvel</Link>
              </li>
              <li>
                <Link to="/rentalGuides">Guia para aluguéis</Link>
              </li>
            </ul>
          )}
        </div>

        <InitialOptions>
          {auth.user?.role === 'HOST' ? (
            <BecomeHostButton>
              <Link className="tenant" to="/rentalGuides">
                Dicas para anúnciar
              </Link>
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
              {auth.user?.role === 'HOST' && (
                <>
                  <li className="host">
                    <Link to="users/myHotels">Meus hotéis</Link>
                  </li>
                  <li className="host">
                    <Link to="users/host/reservations">Reservas Pendentes</Link>
                  </li>
                  <li className="host">
                    <Link to="users/me">Perfil</Link>
                  </li>
                  <li className="host">
                    <button onClick={handleLogout}>Sair</button>
                  </li>
                </>
              )}
              {auth.user?.role === 'TENANT' && (
                <>
                  <li>
                    <Link to="users/myHotels">Minhas resesrvas</Link>
                  </li>
                  <li>
                    <Link to="users/reservations">Reservas</Link>
                  </li>
                  <li>
                    <Link to="users/me">Perfil</Link>
                  </li>
                  <li>
                    <button onClick={handleLogout}>Sair</button>
                  </li>
                </>
              )}
              {!auth.user?.role && (
                <>
                  <li>
                    <Link to="/login">Entrar</Link>
                  </li>
                  <li>
                    <Link to="/singUp">Cadastrar</Link>
                  </li>
                </>
              )}
            </ul>
          </div>
        </InitialOptions>
      </HeaderContainer>
    </>
  )
}
