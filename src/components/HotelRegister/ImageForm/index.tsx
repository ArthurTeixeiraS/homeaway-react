import { ChangeEvent, FormEvent, useState } from 'react'
import { BackGroundImage, Container } from './styles'
import { Link } from 'react-router-dom'
import axios from 'axios'
import { BaseURL } from '../../../main'

interface FormData {
  image: File | null
}

export function ImageSendForm() {
  const [imageData, setImageData] = useState<FormData>({
    image: null,
  })

  const handleImageChange = (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files && event.target.files[0]
    setImageData((prevData) => ({ ...prevData, image: file }))
  }

  const handleSubmit = async (event: FormEvent) => {
    const roomId = window.location.href.split('/')[5]
    console.log(roomId)
    event.preventDefault()
    const formDataToSend = new FormData()
    if (imageData.image) {
      formDataToSend.append('image', imageData.image)
    }
    try {
      console.log('Dados enviados: ' + formDataToSend)
      const response = await axios.post(
        `${BaseURL}/rooms/${roomId}/image`,
        formDataToSend,
      )

      if (response.status === 200) {
        console.log('Imagem enviada com sucesso!')
        window.location.href = `/users/myHotels`
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
            {imageData.image && (
              <>
                <h2>Pré-visualização:</h2>
                <img
                  src={URL.createObjectURL(imageData.image)}
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
