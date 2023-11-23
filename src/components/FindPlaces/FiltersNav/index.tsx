import { FilterNav } from './styles'
import filterIcon from '../../../assets/filterIcon.png'
import { SearchBar } from './SearchBar/SearchBar'
import { FilterModal } from './Filter Modal'
import { useState } from 'react'

export function FiltersNav() {
  const [open, setOpen] = useState<boolean>(false)

  return (
    <>
      <FilterNav>
        <SearchBar />
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
