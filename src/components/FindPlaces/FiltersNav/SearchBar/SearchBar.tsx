import { FaSearch } from 'react-icons/fa'
import './styles.css'
import { SetStateAction, useState } from 'react'

export const SearchBar = () => {
  const [input, setInput] = useState('')

  const handleChange = (value: SetStateAction<string>) => {
    setInput(value)
  }

  return (
    <div className="inputContainer">
      <FaSearch id="search-icon" />
      <input
        type="text"
        placeholder="Digite para buscar..."
        value={input}
        onChange={(e) => handleChange(e.target.value)}
      />
    </div>
  )
}
