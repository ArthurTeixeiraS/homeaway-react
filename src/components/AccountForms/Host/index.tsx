import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconHost.png'
/* import verifiedIcon from '../../../assets/akar-icons_check.png' */
import { Link, useNavigate } from 'react-router-dom'
import { useContext } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'
import userEditIcon from '../../../assets/6324826.png'

export function AccountFormHost() {
  const auth = useContext(AuthContext)
  const registrationDate = auth.user?.registrationDate
  const navigate = useNavigate()

  const handleLogout = async () => {
    await auth.singout()
    navigate('/')
  }

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
            {/*  <div className="emailVerified">
              <img src={verifiedIcon} alt="" />
              <p>Email Verificado</p>
            </div> */}
            <p>Hospedeiro/Parceiro</p>
          </div>
        </div>
        <div className="content">
          <div className="userInfos">
            <h2>
              Olá, {auth.user?.name}
              <Link to={'/users/edit'}>
                <img src={userEditIcon} width={30} alt="" />
              </Link>
            </h2>
            <p>Cadastrado em: {registrationDate?.split('T')[0]}</p>
          </div>
          <div className="divButton">
            <Link to="/users/myHotels">
              <button>Meus hotéis</button>
            </Link>
            <Link to="/users/addHotel">
              <button>Adicionar um hotel</button>
            </Link>
          </div>
          <div className="exitBtn">
            <button onClick={handleLogout}>Sair</button>
          </div>
        </div>
      </div>
    </FormContainer>
  )
}
