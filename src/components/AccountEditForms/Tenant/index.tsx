import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconTenant.png'
import verifiedIcon from '../../../assets/akar-icons_check.png'
import cancelIcon from '../../../assets/cancel-icon.png'

export function AccountEditTenant() {
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
            <p>Hóspede/Parceiro</p>
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
            <input
              type="text"
              id="cpf"
              placeholder="Seu CPF"
              required
              disabled
            />
            <input type="date" id="bday" placeholder="Data de Nascimento" />
            <label htmlFor="bday">*Data de Aniversário</label>
            <div className="buttons">
              <a href="/users/me">
                <button className="cancel" type="button">
                  <img src={cancelIcon} alt="" />
                  Cancelar
                </button>
              </a>
              <button className="remove">Remover Conta</button>
              <button className="save">Salvar</button>
            </div>
          </form>
        </div>
      </div>
    </FormContainer>
  )
}
