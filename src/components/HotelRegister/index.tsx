import { useState, ChangeEvent, FormEvent, useContext } from 'react'
import { BackGroundImage, Container } from './styles'
import axios from 'axios'
import { Link } from 'react-router-dom'
import { BaseURL } from '../../main'
import { AuthContext } from '../../contexts/Auth/AuthContext'

interface FormData {
  name: string
  description: string
  street: string
  number: string
  neighbourhood: string
  city: string
  uf: string
  allowsPets: boolean
  hasWifi: boolean
  hasRoomService: boolean
  /*   image: File | null */
}

export function HotelForm() {
  const [formData, setFormData] = useState<FormData>({
    name: '',
    description: '',
    street: '',
    number: '',
    neighbourhood: '',
    city: '',
    uf: '',
    allowsPets: false,
    hasWifi: false,
    hasRoomService: false,
    /*     image: null, */
  })

  const auth = useContext(AuthContext)

  const handleInputChange = (
    event: ChangeEvent<
      HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
    >,
  ) => {
    const { name, value } = event.target
    setFormData((prevData) => ({ ...prevData, [name]: value }))
  }

  const handleCheckboxChange = (event: ChangeEvent<HTMLInputElement>) => {
    const { name, checked } = event.target
    setFormData((prevData) => ({ ...prevData, [name]: checked }))
  }

  /*  const handleImageChange = (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files && event.target.files[0]
    setFormData((prevData) => ({ ...prevData, image: file }))
  } */

  const handleSubmit = async (event: FormEvent) => {
    event.preventDefault()
    try {
      const response = await axios.post(`${BaseURL}/hotels`, formData, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('authToken')}`,
        },
      })

      if (response.status === 200) {
        console.log(response.data)
        window.location.href = `/users/addHotel/${response.data.id}/image`
      } else {
        console.error('Erro ao enviar o registro. Tente novamente.')
      }
    } catch (error) {
      console.error('Erro na requisição:', error)
    }
  }

  return (
    <BackGroundImage>
      <Container>
        <form onSubmit={handleSubmit}>
          <h1>Cadastro de hotel</h1>
          <p>para: {auth.user?.name}</p>
          <div className="inputs">
            <label>Nome do Hotel:</label>
            <input
              type="text"
              name="name"
              value={formData.name}
              onChange={handleInputChange}
              required
            />

            <label>Descrição:</label>
            <textarea
              cols={8}
              rows={8}
              name="description"
              value={formData.description}
              onChange={handleInputChange}
              required
              minLength={20}
            ></textarea>

            {/* <div className="image">
              <label className="labelImage" htmlFor="mainImage">
                <p>Selecione uma imagem:</p>
              </label>
              <div>
                <input
                  type="file"
                  id="mainImage"
                  accept="image/*"
                  onChange={handleImageChange}
                  required
                />
              </div>
              {formData.image && (
                <>
                  <h2>Pré-visualização:</h2>
                  <img
                    src={URL.createObjectURL(formData.image)}
                    alt="Preview"
                    style={{ maxWidth: '200px', maxHeight: '200px' }}
                  />
                </>
              )}
            </div> */}

            <div className="streetNumber">
              <label>Rua:</label>
              <label>Número:</label>
              <input
                type="text"
                name="street"
                value={formData.street}
                onChange={handleInputChange}
                required
              />

              <input
                type="text"
                name="number"
                value={formData.number}
                onChange={handleInputChange}
                required
              />
            </div>

            <label>Bairro:</label>
            <input
              type="text"
              name="neighbourhood"
              value={formData.neighbourhood}
              onChange={handleInputChange}
              required
            />

            <div className="cityuf">
              <label>Cidade:</label>
              <label>Estado:</label>
              <input
                type="text"
                name="city"
                value={formData.city}
                onChange={handleInputChange}
                required
              />

              <select
                required
                name="uf"
                value={formData.uf}
                onChange={handleInputChange}
              >
                <option disabled selected>
                  Selecione um estado
                </option>
                <option value="Acre">AC</option>
                <option value="Alagoas">AL</option>
                <option value="Amapá">AP</option>
                <option value="Amazonas">AM</option>
                <option value="Bahia">BA</option>
                <option value="Ceará">CE</option>
                <option value="Distrito Federal">DF</option>
                <option value="Espírito Santo">ES</option>
                <option value="Goiás">GO</option>
                <option value="Maranhão">MA</option>
                <option value="Mato Grosso">MT</option>
                <option value="Mato Grosso do Sul">MS</option>
                <option value="Minas Gerais">MG</option>
                <option value="Pará">PA</option>
                <option value="Paraíba">PB</option>
                <option value="Paraná">PR</option>
                <option value="Pernambuco">PE</option>
                <option value="Piauí">PI</option>
                <option value="Rio de Janeiro">RJ</option>
                <option value="Rio Grande do Norte">RN</option>
                <option value="Rio Grande do Sul">RS</option>
                <option value="Rondônia">RO</option>
                <option value="Roraima">RR</option>
                <option value="Santa Catarina">SC</option>
                <option value="São Paulo">SP</option>
                <option value="Sergipe">SE</option>
                <option value="Tocantins">TO</option>
              </select>
            </div>

            <div className="filters">
              <div className="allowPets">
                <label>Permite animais:</label>
                <input
                  type="checkbox"
                  name="allowsPets"
                  checked={formData.allowsPets}
                  onChange={handleCheckboxChange}
                />
              </div>

              <div className="hasWifi">
                <label>Tem acesso a Wi-Fi:</label>
                <input
                  type="checkbox"
                  name="hasWifi"
                  checked={formData.hasWifi}
                  onChange={handleCheckboxChange}
                />
              </div>

              <div className="hasRoomService">
                <label>Possui serviço de quarto:</label>
                <input
                  type="checkbox"
                  name="hasRoomService"
                  checked={formData.hasRoomService}
                  onChange={handleCheckboxChange}
                />
              </div>
            </div>
          </div>
          <div className="submit">
            <Link to="/users/me">
              <button type="button">Cancelar</button>
            </Link>
            <button type="submit">Enviar</button>
          </div>
        </form>
      </Container>
    </BackGroundImage>
  )
}
