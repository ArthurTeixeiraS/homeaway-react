import { ChangeEvent, FormEvent, useState } from 'react'
import { BackGroundImage, Container } from './styles'
import { Link, useNavigate } from 'react-router-dom'
import axios from 'axios'
import { BaseURL } from '../../../main'

interface FormData {
  fileImage: File | null
}

export function ImageSendForm() {
  const [imageData, setImageData] = useState<FormData>({
    fileImage: null,
  })

  const navigate = useNavigate()

  const handleImageChange = (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files && event.target.files[0]
    setImageData((prevData) => ({ ...prevData, fileImage: file }))
  }

  const handleSubmit = async (event: FormEvent) => {
    const hotelId = window.location.href.split('/')[5]
    event.preventDefault()
    const formDataToSend = new FormData()

    if (imageData.fileImage) {
      formDataToSend.append('fileImage', imageData.fileImage)
    }
    console.log(formDataToSend.values())
    try {
      /* console.log('Dados enviados: ' + { formDataToSend }) */
      const response = await axios.post(
        `${BaseURL}/hotels/${hotelId}/image`,
        formDataToSend,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'Content-Type': 'multipart/form-data',
          },
        },
      )
      console.log(response)

      if (response.status === 204) {
        console.log('Imagem enviada com sucesso!')
        navigate(`/users/myHotels`)
      } else {
        console.error('Erro ao enviar o resgistro. Tente novamente')
      }
    } catch (e) {
      console.error('Erro na requisição:', e)
    }
  }

  return (
    <BackGroundImage>
      <Container>
        <form onSubmit={handleSubmit}>
          <h1>Selecione a imagem para o seu hotel</h1>
          <div className="image">
            <label className="labelImage" htmlFor="mainImage">
              <p>Selecione uma imagem</p>
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
            {imageData.fileImage && (
              <>
                <h2>Pré-visualização:</h2>
                <img
                  src={URL.createObjectURL(imageData.fileImage)}
                  alt="Preview"
                  style={{ maxWidth: '200px', maxHeight: '200px' }}
                />
              </>
            )}
          </div>
          <div className="submit">
            <Link to="/users/me">
              <button type="button"> Cancelar</button>
            </Link>
            <button type="submit"> Enviar</button>
          </div>
        </form>
      </Container>
    </BackGroundImage>
  )
}
