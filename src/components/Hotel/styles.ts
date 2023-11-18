import { styled } from 'styled-components'

export const Container = styled.div`
  padding: 5%;
  display: flex;
  flex-direction: column;
  .cardContainer {
    border: 1px solid black;
    border-radius: 1.5rem;
  }
`

export const TitleContainer = styled.div`
  display: flex;
  margin-bottom: 5rem;
  h1 {
    text-align: start;
    font-size: 2.5rem;
  }
`
