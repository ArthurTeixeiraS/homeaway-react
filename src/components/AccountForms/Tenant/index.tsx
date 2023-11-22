import { FormContainer } from './styles'
import userIcon from '../../../assets/userIcon.png'
/* import verifiedIcon from '../../../assets/akar-icons_check.png' */
import { Link } from 'react-router-dom'
import { useContext } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'

export function AccountFormTenant() {
  const auth = useContext(AuthContext)
  return (
    <FormContainer>
      <div className="infoDiv">
        <div className="staticInfo">
          <img src={userIcon} alt="" />
          <div className="infos">
            <h2>{auth.user?.name}</h2>
            <p>{auth.user?.email}</p>
          </div>
          <div className="verified">
            {/* <div className="emailVerified">
              <img src={verifiedIcon} alt="" />
              <p>Email Verificado</p>
            </div> */}
            <p>Cliente/Hóspede</p>
          </div>
        </div>
        <div className="content">
          <div className="userInfos">
            <h2>Olá, {auth.user?.name}</h2>
            <p>Cadastrado em: {auth.user?.registrationDate.split('T')[0]}</p>
          </div>
          <div className="divButton">
            <Link to="/users/edit">
              <button>Editar Perfil</button>
            </Link>
          </div>
          <div className="link">
            <Link to="/client/reservations">Suas Reservas</Link>
          </div>
        </div>
      </div>
    </FormContainer>
  )
}
