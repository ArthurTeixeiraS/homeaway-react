import styled from 'styled-components'

export const FindPlacesContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  .roomBlocksContainer {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    grid-gap: 1rem;
    padding: 2rem 5rem;
  }
`
