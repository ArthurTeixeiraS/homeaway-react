import styled from 'styled-components'

export const Container = styled.div`
  width: 342px;
  height: 300px;
  border-radius: 1.5rem;
  .imgContainer {
    display: flex;
    justify-content: center;
    align-items: center;
    img {
      border-radius: 1.5rem;
      width: 100%;
      aspect-ratio: 3/3;
    }
  }
`
