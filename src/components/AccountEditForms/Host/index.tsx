import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconHost.png'
import verifiedIcon from '../../../assets/akar-icons_check.png'
import cancelIcon from '../../../assets/cancel-icon.png'
import { Link, useNavigate } from 'react-router-dom'
import { ChangeEvent, FormEvent, useContext, useState } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'
import axios from 'axios'
import { BaseURL } from '../../../main'

interface FormData {
  name: string
  email: string
  document: string
  birthDate: string
}

export function AccountEditHost() {
  const auth = useContext(AuthContext)
  const navigate = useNavigate()

  const registerDate = auth.user?.registrationDate

  const [formData, setFormData] = useState<FormData>({
    name: auth.user?.name as string,
    email: auth.user?.email as string,
    document: auth.user?.document as string,
    birthDate: auth.user?.birthDate as string,
  })

  const handleInputChange = (
    event: ChangeEvent<
      HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
    >,
  ) => {
    const { name, value } = event.target
    setFormData((prevData) => ({ ...prevData, [name]: value }))
  }

  const handleSubmit = async (event: FormEvent) => {
    event.preventDefault()
    const formDataToSend = formData

    try {
      const response = await axios.put(
        `${BaseURL}/users/update`,
        formDataToSend,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
          },
        },
      )

      if (response.status === 200) {
        console.log('Registro alterado com sucesso: ', response.data)
        navigate('/users/me')
      }
    } catch (e) {
      console.error(e, 'Erro na requisição')
    }
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
            <p>Cadastrado em: {registerDate?.split('T')[0]}</p>
          </div>
          <form action="" onSubmit={handleSubmit}>
            <input
              type="text"
              placeholder="Seu Nome"
              required
              value={auth.user?.name}
              onChange={handleInputChange}
            />
            <input
              type="email"
              placeholder="Seu Email"
              required
              value={auth.user?.email}
              onChange={handleInputChange}
            />
            <input
              type="text"
              className="cpf"
              value={auth.user?.document}
              placeholder="Seu Documento"
              required
              onChange={handleInputChange}
            />

            <input
              type="date"
              id="bday"
              placeholder="Data de Nascimento"
              onChange={handleInputChange}
              value={auth.user?.birthDate}
            />

            <label htmlFor="bday">*Data de Aniversário</label>
            <div className="buttons">
              <Link to="/users/me">
                <button className="cancel" type="button">
                  <img src={cancelIcon} alt="" />
                  Cancelar
                </button>
              </Link>
              <button className="remove">Remover Conta</button>
              <button className="save">Salvar</button>
            </div>
          </form>
        </div>
      </div>
    </FormContainer>
  )
}
