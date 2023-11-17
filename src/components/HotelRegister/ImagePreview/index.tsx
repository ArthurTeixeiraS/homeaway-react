import React, { ChangeEvent, useState } from 'react'
import { Container } from './styles'

interface ImageInputProps {
  label?: string
  onChange: (image: string | null) => void
  maxWidth?: string
  maxHeight?: string
}

const ImageInput: React.FC<ImageInputProps> = ({ label, onChange }) => {
  const [image, setImage] = useState<string | null>(null)

  const handleImageChange = (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0]

    if (file) {
      const reader = new FileReader()
      reader.onloadend = () => {
        setImage(reader.result as string)
        onChange(reader.result as string)
      }
      reader.readAsDataURL(file)
    } else {
      setImage(null)
      onChange(null)
    }
  }

  return (
    <Container>
      {label && (
        <label className="labelImage" htmlFor="mainImage">
          <p>{label}</p>
        </label>
      )}
      <input
        type="file"
        accept="image/*"
        onChange={handleImageChange}
        name="mainImage"
        id="mainImage"
      />

      {image && (
        <div>
          <h2>Pré-visualização:</h2>
          <img src={image} alt="Imagem selecionada" />
        </div>
      )}
    </Container>
  )
}

export default ImageInput
