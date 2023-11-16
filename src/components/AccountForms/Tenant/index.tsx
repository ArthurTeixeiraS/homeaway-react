import { FormContainer } from './styles'
import userIcon from '../../../assets/userIcon.png'
import verifiedIcon from '../../../assets/akar-icons_check.png'

export function AccountFormTenant() {
  return (
    <FormContainer>
      <div className="infoDiv">
        <div className="staticInfo">
          <img src={userIcon} alt="" />
          <div className="infos">
            <h2>NOMEDOUSUÁRIO</h2>
            <p>email@email.com</p>
          </div>
          <div className="verified">
            <div className="emailVerified">
              <img src={verifiedIcon} alt="" />
              <p>Email Verificado</p>
            </div>
            <p>Cliente/Hóspede</p>
          </div>
        </div>
        <div className="content">
          <div className="userInfos">
            <h2>Olá, NOMEDOUSUÁRIO</h2>
            <p>Cadastrado em: DATADECADASTRO</p>
          </div>
          <div className="divButton">
            <a href="/users/edit">
              <button>Editar Perfil</button>
            </a>
          </div>
          <div className="link">
            <a href="/client/reservations">Suas Reservas</a>
          </div>
        </div>
      </div>
    </FormContainer>
  )
}
