import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconHost.png'
import verifiedIcon from '../../../assets/akar-icons_check.png'

export function AccountEditHost() {
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
            <p>Hospedeiro/Parceiro</p>
          </div>
        </div>
        <div className="content">
          <div className="userInfos">
            <h2>Olá, NOMEDOUSUÁRIO</h2>
            <p>Cadastrado em: DATADECADASTRO</p>
          </div>
          <form action="">
            <input type="text" placeholder="Seu Nome" required />
            <input type="email" placeholder="Seu Email" required />
            <input type="text" placeholder="Seu CPF" required />
            <input type="date" id="bday" placeholder="Data de Nascimento" />
            <label htmlFor="bday">*Data de Aniversário</label>
          </form>
        </div>
      </div>
    </FormContainer>
  )
}
