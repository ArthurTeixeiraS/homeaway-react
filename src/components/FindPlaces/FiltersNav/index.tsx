import { FilterNav } from './styles'
import filterIcon from '../../../assets/filterIcon.png'
import { FaSearch, FaPaperPlane } from 'react-icons/fa'
import { FilterModal } from './Filter Modal'
import { SetStateAction, useState } from 'react'

export function FiltersNav() {
  const [open, setOpen] = useState<boolean>(false)
  const [search, setSearch] = useState('')

  const handleChange = (value: SetStateAction<string>) => {
    setSearch(value)
  }

  return (
    <>
      <FilterNav>
        <form className="inputContainer">
          <FaSearch id="search-icon" />
          <input
            className="inpt-search"
            type="text"
            placeholder="Digite para buscar..."
            value={search}
            onChange={(e) => handleChange(e.target.value)}
          />
          <button type="submit">
            <FaPaperPlane size={18} color={'#4086F4'} />
          </button>
        </form>
        <div className="filterButton">
          <button onClick={() => setOpen(!open)}>
            <img src={filterIcon} width={17} alt="" />
            Filtrar
          </button>
        </div>
      </FilterNav>
      <FilterModal isOpen={open} setOpen={setOpen} />
    </>
  )
}
