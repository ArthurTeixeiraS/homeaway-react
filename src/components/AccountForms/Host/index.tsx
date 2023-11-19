import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconHost.png'
import verifiedIcon from '../../../assets/akar-icons_check.png'
import { Link } from 'react-router-dom'
import { useContext } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'

export function AccountFormHost() {
  const auth = useContext(AuthContext)
  console.log(auth)
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
            <div className="emailVerified">
              <img src={verifiedIcon} alt="" />
              <p>Email Verificado</p>
            </div>
            <p>Hospedeiro/Parceiro</p>
          </div>
        </div>
        <div className="content">
          <div className="userInfos">
            <h2>Olá, {auth.user?.name}</h2>
            <p>Cadastrado em: DATADECADASTRO</p>
          </div>
          <div className="divButton">
            <Link to="/users/edit">
              <button>Editar Perfil</button>
            </Link>
            <Link to="/users/addHotel">
              <button>Adicionar um hotel</button>
            </Link>
          </div>
          <div className="link">
            <Link to="/users/myHotels">Seus Hotéis</Link>
          </div>
        </div>
      </div>
    </FormContainer>
  )
}
