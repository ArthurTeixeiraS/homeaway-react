import { useState, ChangeEvent, FormEvent, useEffect } from 'react'
import { BackGroundImage, Container } from './styles'
import axios from 'axios'
import { Link, useNavigate } from 'react-router-dom'
import { BaseURL } from '../../main'
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
}

export function HotelEditComponent() {
  const idHotel = window.location.href.split('/')[6]
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
  })
  const [dataLoaded, setDataLoaded] = useState(false)

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`${BaseURL}/hotels/${idHotel}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        })
        const hotelData = response.data
        setFormData({
          name: hotelData.name,
          description: hotelData.description,
          street: hotelData.street,
          number: hotelData.number,
          neighbourhood: hotelData.neighbourhood,
          city: hotelData.city,
          uf: hotelData.uf,
          allowsPets: hotelData.allowsPets,
          hasWifi: hotelData.hasWifi,
          hasRoomService: hotelData.hasRoomService,
        })

        setDataLoaded(true)
        console.log(response)
      } catch (error) {
        console.error('Erro ao obter dados do hotel:', error)
      }
    }
    fetchData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

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

  /* const handleImageChange = (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files && event.target.files[0]
    setFormData((prevData) => ({ ...prevData, image: file }))
  } */

  const navigate = useNavigate()
  const handleSubmit = async (event: FormEvent) => {
    event.preventDefault()
    const formDataToSend = new FormData()

    formDataToSend.append('name', formData.name)
    formDataToSend.append('description', formData.description)
    formDataToSend.append('street', formData.street)
    formDataToSend.append('number', formData.number)
    formDataToSend.append('neighbourhood', formData.neighbourhood)
    formDataToSend.append('city', formData.city)
    formDataToSend.append('uf', formData.uf)
    formDataToSend.append('allowsPets', String(formData.allowsPets))
    formDataToSend.append('hasWifi', String(formData.hasWifi))
    formDataToSend.append('hasRoomService', String(formData.hasRoomService))

    try {
      console.log('Dados enviados:', formData)
      const response = await axios.put(
        `${BaseURL}/hotels/${idHotel}`,
        formDataToSend,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
            'Content-Type': 'application/json',
          },
        },
      )

      if (response.status === 200) {
        console.log('Registro enviado com sucesso!')
        navigate(`/users/myHotels/edit/${idHotel}/image`)
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
        {dataLoaded ? (
          <form onSubmit={handleSubmit}>
            <h1>Cadastro de hotel</h1>
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

              {/*   <div className="image">
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

              <div className="cityUF">
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
        ) : (
          <h1>Carregando dados do Hotel...</h1>
        )}
      </Container>
    </BackGroundImage>
  )
}
